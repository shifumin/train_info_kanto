FROM ruby:2.6.3-alpine

RUN apk update && \
    apk upgrade && \
    apk add --no-cache \
    git \
    build-base \
    libxslt-dev \
    libxml2-dev

RUN gem install traininfo_kanto --no-document

ENTRYPOINT ["traininfo_kanto"]
