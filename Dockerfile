FROM debian:13-slim

LABEL maintainer "genzouw <genzouw@gmail.com>"

# ベースイメージ公開後に Debian security へ出た修正版 (perl-base / openssl / libpcre2 / gzip / util-linux 等) を取り込む
RUN apt-get update \
  && apt-get -y upgrade \
  && apt-get -y install \
    --no-install-recommends \
    csvtool \
  && apt-get clean \
  && rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*

ENTRYPOINT ["csvtool"]
