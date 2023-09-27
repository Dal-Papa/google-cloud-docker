#!/usr/bin/env sh

# Create Firebase Storage config file.
cat <<EOT >/firebase/storage.rules
rules_version = '2';
service firebase.storage {
  match /b/{bucket}/o {
    match /{allPaths=**} {
      allow read, write: if true;
    }
  }
}
EOT

# Create Firebase config file.
cat <<EOT >/firebase/firebase.json
{
  "storage": {
    "rules": "./storage.rules"
  },
  "emulators": {
    "storage": {
      "port": "${STORAGE_LISTEN_PORT}",
      "host": "${FIREBASE_EMULATORS_HOST}"
    },
    "auth": {
      "port": "${FIREBASE_LISTEN_PORT}",
      "host": "${FIREBASE_EMULATORS_HOST}"
    }
  }
}
EOT

firebase emulators:start --project="${FIREBASE_PROJECT_ID}" --import /firebase/baseline-data
