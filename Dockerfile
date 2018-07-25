FROM debian:stable-slim
##TEMPLATING template=docker_header
ARG CI_PROJECT_URL
ARG CI_BUILD_REF
LABEL maintainer="Jean-Avit Promis docker@katagena.com"
LABEL org.label-schema.vcs-url="${CI_PROJECT_URL}"
LABEL version="latest"
###TEMPLATING

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update --fix-missing && \
	apt-get update && \
	apt-get install -y -q lintian fakeroot git

RUN mkdir -p /root/packages/
WORKDIR /root/packages/

ENTRYPOINT ["/usr/bin/lintian"]
