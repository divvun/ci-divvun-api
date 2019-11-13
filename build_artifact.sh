#!/bin/bash
set -euxo pipefail

ROOT=$PWD
DIST=$ROOT/dist
rm -rf $DIST && mkdir $DIST

echo "building msoffice addin"
git clone --single-branch --depth=1 https://github.com/divvun/divvun-gramcheck-web.git || (cd divvun-gramcheck-web && git pull && cd ..)
cd divvun-gramcheck-web/msoffice
npm ci
npm run build
mkdir $DIST/msoffice
cp -R dist/* $DIST/msoffice/

cd $ROOT

echo "copying configs"
cp docker-compose.yml $DIST
cp install.sh $DIST

git clone --single-branch --branch develop --depth=1 git@github.com:divvun/divvun-api.git || (cd divvun-api && git pull && cd ..)
docker build -t divvun/divvun-api divvun-api
docker save divvun/divvun-api | gzip > $DIST/divvun-api.tar.gz

pushd $DIST
tar cvvfz "$ROOT/dist.tar.gz" .
