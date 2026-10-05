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
FROM gcr.io/distroless/base-debian13@sha256:389cad21f73e4c37b94ffe5b13736d5a92bd5bd3c6c6b38c2be1c881e14ba2bd

LABEL maintainer="genzouw <genzouw@gmail.com>"

COPY --from=builder /usr/bin/csvtool /usr/bin/csvtool

ENTRYPOINT ["/usr/bin/csvtool"]
