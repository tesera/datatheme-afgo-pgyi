#!/usr/bin/env node
'use strict';
// usage: node ./build.js <datatheme_name>
// example: node ./build.js dev.afgo.pgyi

var fs = require('fs');
var JSONStream = require('JSONStream');
var es = require('event-stream');

fs.createReadStream('datatheme.json')
    .pipe(JSONStream.parse())
    .pipe(es.map(function (theme, callback) {
        var resources = theme.resources.map(function (r) {
            r.schema = JSON.parse(fs.readFileSync(r.schema, 'utf8'));
            if(process.argv[2]) r.validator = r.validator.replace('afgo.pgyi', process.argv[2]);
            return r;
        });
        delete theme.resources;
        var datapackage = {
            name: 'afgo-pgyi-dataset',
            theme: theme,
            resources: resources
        };
        callback(null, JSON.stringify(datapackage));
    }))
    .pipe(process.stdout);