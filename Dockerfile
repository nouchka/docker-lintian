FROM debian:stable-slim
LABEL maintainer="Jean-Avit Promis docker@katagena.com"
LABEL org.label-schema.vcs-url="https://github.com/nouchka/docker-lintian"
LABEL version="latest"

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update --fix-missing && \
	apt-get install -y -q lintian fakeroot git && \
	mkdir -p /root/packages/
WORKDIR /root/packages/

ENTRYPOINT ["/usr/bin/lintian"]
