#!/usr/bin/env bash

# Check user environment variable
FIREBASE_PROJECT_ID=${FIREBASE_PROJECT_ID:=demo-dev}

# Start emulator
firebase emulators:start \
    --only auth \
    --project ${FIREBASE_PROJECT_ID}