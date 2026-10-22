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
FROM gcr.io/distroless/base-debian13@sha256:44a80dc28b49f47396e72ab2dc644b3f849880335de09625762faed207bb891d

LABEL maintainer="genzouw <genzouw@gmail.com>"

COPY --from=builder /usr/bin/csvtool /usr/bin/csvtool

ENTRYPOINT ["/usr/bin/csvtool"]
