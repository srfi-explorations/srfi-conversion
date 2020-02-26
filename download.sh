#!/bin/bash
set -eu -o pipefail
cd "$(dirname "$0")"
echo "Entering directory '$PWD'"
set -x
curl --fail --silent --show-error https://srfi.schemers.org/srfi.tgz |
    gunzip >srfi.tar.new
mv -f srfi.tar.new srfi.tar
