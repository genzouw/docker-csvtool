FROM debian:13-slim AS builder

RUN apt-get update \
  && apt-get -y install \
    --no-install-recommends \
    csvtool \
  && apt-get clean \
  && rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*

# csvtool が動的リンクするのは libc / libm のみ。Snyk は最終ステージの FROM だけを解析するため、
# OS パッケージをほとんど持たない distroless に csvtool 本体だけを載せて検出対象を最小化する
# ダイジェスト固定は Renovate（.github/renovate.json の pinDigests）が更新 PR で追従する
FROM gcr.io/distroless/base-debian13@sha256:65be09d063b5d4737995ca5a17bb7e12ed990412751ec8ec212c9d74db257639

LABEL maintainer="genzouw <genzouw@gmail.com>"

COPY --from=builder /usr/bin/csvtool /usr/bin/csvtool

ENTRYPOINT ["/usr/bin/csvtool"]
