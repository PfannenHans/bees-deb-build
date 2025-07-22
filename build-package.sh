#!/usr/bin/env -S bash -e

# Change these variables to build another version
BEES_VERSION=0.11
PACKAGE_VERSION=0

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

docker build -t bees-build ${SCRIPT_DIR}
docker run --rm -v ${SCRIPT_DIR}:/srv -e "BEES_VERSION=${BEES_VERSION}" -e "PACKAGE_VERSION=${PACKAGE_VERSION}" bees-build
