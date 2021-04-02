FROM debian:stretch-slim

LABEL maintainer "genzouw <genzouw@gmail.com>"

RUN apt-get update \
  && apt-get -y install \
    --no-install-recommends \
    csvtool \
  && apt-get clean \
  && rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*

ENTRYPOINT ["csvtool"]
