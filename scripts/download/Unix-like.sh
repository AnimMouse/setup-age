#!/bin/sh
set -eu
echo ::group::Downloading age $version for $RUNNER_OS
if [ $RUNNER_OS = macOS ]; then os=darwin; else os=linux; fi
mkdir age
wget -qO- $GITHUB_SERVER_URL/FiloSottile/age/releases/download/$version/age-$version-$os-amd64.tar.gz | tar -xzC age --strip-components 1 age/age age/age-keygen
echo ::endgroup::