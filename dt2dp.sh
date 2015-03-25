#!/usr/bin/env bash

echo '{"name": "afgo-dataset",'
echo '"datatheme": { "name": "afgo.pgyi", "version": "2.0.0", "repository": "https://github.com/tesera/datatheme-afgo.git"},'
echo '"resources": ['
    cat ./schemas/plot.json
    echo ,
    cat ./schemas/trees.json
    echo ,
    cat ./schemas/plot_measurement.json
    echo ,
    cat ./schemas/trees_measurement.json
    echo ,
    cat ./schemas/photo_avi.json
    echo ,
    cat ./schemas/treatment.json
    echo ,
    cat ./schemas/disturbance.json
    echo ,
    cat ./schemas/regeneration.json
echo ']}'