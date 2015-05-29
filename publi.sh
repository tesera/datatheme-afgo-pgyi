#!/usr/bin/env bash

# build datatheme resources
# usage: $ bash ./publi.sh

# build & deploys datatheme resources to host s3 bucket
# usage: $ bash ./publi.sh put dev.afgo.pgyi

# dependencies:
# aws cli : http://aws.amazon.com/cli/
# nodejs : https://nodejs.org/
# bawlk : https://github.com/tesera/bawlk

datatheme_root=s3://tesera.datathemes
datatheme_path="$datatheme_root/$2"

flags="--acl public-read \
--cache-control no-cahe"

echo "building datapackage.json"
bash ./dt2dp.sh > ./www/datapackage.json &&

mkdir ./www/awk ./www/rules
echo "compiling bawlk rules from datapackage.json"
bawlk rules -d ./www/datapackage.json -o ./www/rules

echo "compiling bawlk scripts from datapackage.json"
bawlk scripts -d ./www/datapackage.json -o ./www/awk

if [ "$1" == "put" ]; then
    echo "publishing datatheme resources to s3"
    aws s3 cp ./www/partials/ $datatheme_path/partials --recursive --content-type text/html $flags
    aws s3 cp ./www/index.html $datatheme_path/index.html --content-type text/html $flags
    aws s3 cp ./www/datapackage.json $datatheme_path/datapackage.json --content-type application/json $flags
    aws s3 cp ./www/awk/ $datatheme_path/awk --recursive --content-type text/plain $flags
    aws s3 cp ./www/rules/ $datatheme_path/rules --recursive --content-type text/plain $flags
    echo "publishing complete"
fi

echo "done"
