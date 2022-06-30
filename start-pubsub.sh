#!/usr/bin/env bash

# Check user environment variable
PUBSUB_PROJECT_ID=${PUBSUB_PROJECT_ID:=dev}
PUBSUB_LISTEN_ADDRESS=${PUBSUB_LISTEN_ADDRESS:=0.0.0.0:8085}

# Config gcloud project
gcloud config set project ${PUBSUB_PROJECT_ID}

# Start emulator
gcloud beta emulators pubsub start \
  --data-dir=/opt/data \
  --quiet \
  --project=${PUBSUB_PROJECT_ID} \
  --host-port=${PUBSUB_LISTEN_ADDRESS}