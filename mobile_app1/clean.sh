#!/bin/bash

# Do not run this script directly, it is invoked via 'bazel run //:clean'

cd ../.. || exit 1
dir=$(pwd)

echo "Deleting project targets built by bazel in folder:$dir"

[ ! -d "external" ] && echo "Directory external DOES NOT exists." && exit 1

find . -mindepth 1 -maxdepth 1 -type d -not -name external -exec rm -rf '{}' \;

echo "Deletion complete"
