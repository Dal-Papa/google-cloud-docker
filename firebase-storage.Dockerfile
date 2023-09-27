FROM node:lts-alpine3.13 AS app-env
LABEL maintainer="Dal-Papa"

RUN apk add --no-cache python3 py3-pip openjdk11-jre bash && \
    npm install -g firebase-tools && \
    firebase setup:emulators:storage && \
    rm -rf /var/cache/apk/*

ENV FIREBASE_PROJECT_ID="demo-dev"
ENV FIREBASE_EMULATORS_HOST="0.0.0.0"
ENV FIREBASE_LISTEN_PORT="9099"
EXPOSE $FIREBASE_LISTEN_PORT
ENV STORAGE_LISTEN_PORT="9199"
EXPOSE $STORAGE_LISTEN_PORT

RUN mkdir -p /firebase/baseline-data
VOLUME /firebase

COPY start-firebase-storage.sh /
RUN chmod +x /start-firebase-storage.sh

WORKDIR /firebase

ENTRYPOINT ["/start-firebase-storage.sh"]