FROM debian:stable-slim

ARG VERSION=2

RUN  apt-get update && \
	DEBIAN_FRONTEND=noninteractive apt-get install --no-install-recommends -yq lintian=${VERSION}.* fakeroot=* git=* && \
	mkdir -p /root/packages/ && \
	rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
WORKDIR /root/packages/

ENTRYPOINT ["/usr/bin/lintian"]
