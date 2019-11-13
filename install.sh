#!/bin/bash
set -euxo pipefail
gunzip -c divvun-api.tar.gz | docker image load
mkdir -p data/grammar
mkdir -p data/spelling
mkdir -p data/hyphenation
