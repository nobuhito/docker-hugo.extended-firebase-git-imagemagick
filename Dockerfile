FROM node:12.7.0-alpine

# labels
LABEL maintainer="nobuhito.sato@gmail.com"

# variables
ENV HUGO_VERSION 0.56.1

# install hugo
RUN set -x && \
  apk add --no-cache findutils libstdc++ wget ca-certificates && \
  # make sure we have up-to-date certificates
  update-ca-certificates && \
  cd /tmp &&\
  wget https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_VERSION}_Linux-64bit.tar.gz -O hugo.tar.gz && \
  tar xzf hugo.tar.gz && \
  mv ./hugo /usr/bin/hugo && \
  rm -r * && \
  # don't delete ca-certificates pacakge here since it remove all certs too
  apk del wget

# install firebase-cli
# use --unsafe-perm to solve the issue: https://github.com/firebase/firebase-tools/issues/372
RUN npm install -g firebase-tools --unsafe-perm

# install git and imagemagick
RUN apk add --no-cache git

