#!/bin/sh
set -eu
echo ::group::Downloading age $version for $RUNNER_OS $RUNNER_ARCH
if [ $RUNNER_OS = macOS ]; then os=darwin; else os=linux; fi
if [ $RUNNER_ARCH = ARM64 ]; then arch=arm64; else arch=amd64; fi
mkdir age
wget -qO- $GITHUB_SERVER_URL/FiloSottile/age/releases/download/$version/age-$version-$os-$arch.tar.gz | tar -xzC age --strip-components 1 age/age age/age-keygen
echo ::endgroup::