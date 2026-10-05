FROM debian:13-slim AS builder

RUN apt-get update \
  && apt-get -y install \
    --no-install-recommends \
    csvtool \
  && apt-get clean \
  && rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*

# csvtool が動的リンクするのは libc / libm のみ。Snyk は最終ステージの FROM だけを解析するため、
# OS パッケージをほとんど持たない distroless に csvtool 本体だけを載せて検出対象を最小化する
# hadolint ignore=DL3007
FROM gcr.io/distroless/base-debian13:latest

LABEL maintainer="genzouw <genzouw@gmail.com>"

COPY --from=builder /usr/bin/csvtool /usr/bin/csvtool

ENTRYPOINT ["/usr/bin/csvtool"]
