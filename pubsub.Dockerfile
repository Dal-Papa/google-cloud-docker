# Version. Can change in build progress
# https://github.com/alpinelinux/docker-alpine/issues/230 with higher version
ARG GCLOUD_SDK_VERSION=472.0.0-alpine

# Use google cloud sdk
FROM gcr.io/google.com/cloudsdktool/google-cloud-cli:$GCLOUD_SDK_VERSION
LABEL maintainer="Dal-Papa"

# Install Java 11 for Pubsub emulator
RUN apk add --update --no-cache openjdk11-jre &&\
    gcloud components install pubsub-emulator beta --quiet

# Volume to persist Pubsub data
VOLUME /opt/data

COPY start-pubsub.sh .
RUN chmod +x start-pubsub.sh

EXPOSE 8081

ENTRYPOINT ["./start-pubsub.sh"]