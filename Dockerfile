FROM ruby:2.5-alpine

RUN apk update && \
    apk upgrade && \
    apk add --no-cache \
    git \
    build-base \
    libxslt-dev \
    libxml2-dev

RUN gem install train_info_kanto --no-document

ENTRYPOINT ["train_info_kanto"]
