#!/bin/bash

npm install

cd functions; npm install

if [ -z "${FIREBASE_TOKEN}" ]; then
    echo "FIREBASE_TOKEN is missing"
    exit 1
fi

if [ -z "${FIREBASE_PROJECT}" ]; then
    echo "FIREBASE_PROJECT is missing"
    exit 1
fi

cd ..

firebase experiments:enable webframeworks

firebase deploy \
    -m "${GITHUB_REF} (${GITHUB_SHA})" \
    --project ${FIREBASE_PROJECT} \
