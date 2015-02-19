#!/usr/bin/env bash

echo '{"name": "afgo-dataset",'
echo '"datatheme": { "name": "afgo", "version": 1.0, "repository": "https://github.com/tesera/datatheme-afgo.git"},'
echo '"resources": ['
    for s in ./schemas/*.json; do (cat $s; echo ',') done
echo ']}'