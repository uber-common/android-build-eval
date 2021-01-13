#!/bin/bash

if ! [ -x "$(command -v bazel)" ]; then
  echo 'Error: bazel is not installed.' >&2
  exit 1
fi

if [[ -z "$GRADLE_PROFILER" ]]; then
  if ! [ -d "gradle-profiler" ]
  then
     echo "Installing Gradle profiler.."
     git clone https://github.com/sunyal/gradle-profiler.git
     cd gradle-profiler || exit

     # gradle dist in repo points to an obsolete snapshot.
     sed -i -e 's/4.8-20180417000132+0000/4.8/g' gradle/wrapper/gradle-wrapper.properties
     sed -i -e 's/-snapshots//g' gradle/wrapper/gradle-wrapper.properties
     ./gradlew installDist

     echo Grade Profile installed successful! Please restart benchmark.
     exit 0
  fi
  GRADLE_PROFILER=./gradle-profiler/build/install/gradle-profiler/bin/gradle-profiler
else
    if ! [ -e "$GRADLE_PROFILER" ]
    then
        echo 'Error: Invalid GRADLE_PROFILER env variable, folder does not exist.' >&2
        exit 1
    fi
fi

BASEDIR=$(dirname "$0")
GRADLE_VERSION=6.7

timestampDir=$(date +"%Y%m%d_%H%M%S")
outputDir=output/$timestampDir
iterations=2
warmups=1

echo "Using gradle profiler from $GRADLE_PROFILER"
echo "Exporting benchmark data to $outputDir"
mkdir -p "$outputDir"/

# shellcheck disable=SC2086
$GRADLE_PROFILER --benchmark --gradle-version $GRADLE_VERSION $2 --iterations=$iterations --warmups=$warmups --output-dir="$outputDir"/buck --scenario-file "$BASEDIR/performance.scenarios" --project-dir . --buck

# shellcheck disable=SC2086
$GRADLE_PROFILER --benchmark --gradle-version $GRADLE_VERSION $2 --iterations=$iterations --warmups=$warmups --output-dir="$outputDir"/gradle --scenario-file "$BASEDIR/performance.scenarios" --project-dir .

# shellcheck disable=SC2086
$GRADLE_PROFILER --benchmark --gradle-version $GRADLE_VERSION $2 --iterations=$iterations --warmups=$warmups --output-dir="$outputDir"/bazel --scenario-file "$BASEDIR/performance.scenarios" --project-dir . --bazel

cat "$outputDir/buck/benchmark.csv" "$outputDir/gradle/benchmark.csv" "$outputDir/bazel/benchmark.csv" >> "$outputDir/all.csv"
