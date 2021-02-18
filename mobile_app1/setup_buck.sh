#!/bin/bash

echo "Generating BUCK project file"
./gradlew -Dokbuck.wrapper=true okbuck --no-configuration-cache
./gradlew -Dokbuck.wrapper=true buckWrapper --no-configuration-cache

echo "Testing BUCK project"
./buckw query rootModule
