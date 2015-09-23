#!/usr/bin/env node
'use strict';
var fs = require('fs');
var JSONStream = require('JSONStream');
var es = require('event-stream');

fs.createReadStream('datatheme.json')
    .pipe(JSONStream.parse())
    .pipe(es.map(function (theme, callback) {
        var resources = theme.resources.map(function (r) {
            return JSON.parse(fs.readFileSync(r.schema, 'utf8'));
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