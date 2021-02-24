#!/bin/bash

echo ">>> Generating BUCK project file"
./gradlew -Dokbuck.wrapper=true okbuck --no-configuration-cache

echo ">>> Generating BUCK wrapper"
./gradlew -Dokbuck.wrapper=true buckWrapper --no-configuration-cache

echo ">>> Shutting down Gradle daemon"
./gradlew --stop

if [[ -n "${DEVPOD_ENVIRONMENT}" ]]; then
  echo ">>> Waiting for buckw lock. Issue with devpod machine only."
  sleep 60
fi

echo ">>> Prefetching external dependencies"
SKIP_OKBUCK=0 ./buckw build .okbuck/ext/...



