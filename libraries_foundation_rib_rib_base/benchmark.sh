#!/bin/bash
# From https://github.com/sunyal/gradle-profiler

if [ -z "$ANDROID_HOME" ]
then
  echo "ANDROID_HOME needs to be set"
  exit;
fi
if [ -z "$ANDROID_REPO_HOME" ]
then
  echo "ANDROID_REPO_HOME needs to be set"
  exit;
fi
if ! [ -x "$(command -v bazel)" ]; then
  echo 'Error: bazel is not installed.' >&2
  exit 1
fi

BASEDIR=$(dirname "$0")
GRADLE_PROFILER=$ANDROID_REPO_HOME/../gradle-profiler/build/install/gradle-profiler/bin/gradle-profiler
PROJECT_PATH=$1

if [[ -z "$3" ]]; then
    GRADLE_VERSION=5.6.4
else
    GRADLE_VERSION=$3
fi

if [ -z "$PROJECT_PATH" ]
then
  echo "Defaulting project to current folder"
  PROJECT_PATH=.
fi

timestampDir=$(date +"%Y%m%d_%H%M%S")
outputDir=output/$timestampDir
iterations=3
warmups=1

echo "Exporting benchmark data to $outputDir"
mkdir -p "$outputDir"/

# shellcheck disable=SC2086
$GRADLE_PROFILER --benchmark --gradle-version $GRADLE_VERSION $2 --iterations=$iterations --warmups=$warmups --output-dir="$outputDir"/buck --scenario-file "$BASEDIR/performance.scenarios" --project-dir "$PROJECT_PATH" --buck

# shellcheck disable=SC2086
$GRADLE_PROFILER --benchmark --gradle-version $GRADLE_VERSION $2 --iterations=$iterations --warmups=$warmups --output-dir="$outputDir"/gradle --scenario-file "$BASEDIR/performance.scenarios" --project-dir "$PROJECT_PATH"

# shellcheck disable=SC2086
$GRADLE_PROFILER --benchmark --gradle-version $GRADLE_VERSION $2 --iterations=$iterations --warmups=$warmups --output-dir="$outputDir"/bazel --scenario-file "$BASEDIR/performance.scenarios" --project-dir "$PROJECT_PATH" --bazel

cat "$outputDir/buck/benchmark.csv" "$outputDir/gradle/benchmark.csv" "$outputDir/bazel/benchmark.csv" >> "$outputDir/all.csv"
