# Version. Can change in build progress
ARG GCLOUD_SDK_VERSION=392.0.0-alpine

# Use google cloud sdk
FROM google/cloud-sdk:$GCLOUD_SDK_VERSION
LABEL maintainer="Dal-Papa"

# Install Java 8 for Datastore emulator
RUN apk add --update --no-cache openjdk8-jre &&\
    gcloud components install cloud-datastore-emulator beta --quiet

# Volume to persist Datastore data
VOLUME /opt/data

COPY start-datastore.sh .
RUN chmod +x start-datastore.sh

EXPOSE 8081

ENTRYPOINT ["./start-datastore.sh"]