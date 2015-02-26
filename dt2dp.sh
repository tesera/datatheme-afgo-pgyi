#!/usr/bin/env bash

echo '{"name": "afgo-dataset",'
echo '"datatheme": { "name": "afgo", "version": 1.0, "repository": "https://github.com/tesera/datatheme-afgo.git"},'
echo '"resources": ['
    schemas=(./schemas/*.json)
    len=${#schemas[@]}

    for ((i=0; i < $len; i+=1));
    do
        (cat "${schemas[i]}")
        if [ $i -lt $len ]; then
            echo ','
        fi
    done

echo ']}'