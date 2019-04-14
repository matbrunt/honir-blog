FROM python:3.6-alpine
MAINTAINER Mat Brunt <matbrunt@gmail.com>

RUN pip install pygments

ENV HUGO_VERSION=0.25

WORKDIR /tmp
RUN wget -O hugo_${HUGO_VERSION}_Linux-64bit.tar.gz https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_VERSION}_Linux-64bit.tar.gz \
    && tar -xzf hugo_${HUGO_VERSION}_Linux-64bit.tar.gz \
    && mkdir -p /usr/local/sbin \
    && mv /tmp/hugo /usr/local/sbin/hugo \
    && rm -rf /tmp/*
RUN apk add --no-cache ca-certificates

COPY ./run.sh /run.sh
RUN chmod +x /run.sh

WORKDIR /src
CMD ["/run.sh"]

EXPOSE 1313
