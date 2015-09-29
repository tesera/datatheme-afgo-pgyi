# datatheme-afgo-pgyi

> !WIP: this is work in progress.

[ ![Codeship Status for tesera/datatheme-pgyi](https://codeship.com/projects/a4acc480-9ff1-0132-e468-3ee0debf623a/status?branch=master)](https://codeship.com/projects/65305)

### What is PGYI?
PGYI is an initiative from the Alberta Forest Growth Organization (AFGO) to collect and share growth and yield plots data within their community.

### What is a Data Theme?
A data theme is a collection of [JSON Table Schema](http://dataprotocols.org/json-table-schema/) which collectively describe a [Tabular Data Package](http://dataprotocols.org/tabular-data-package/) dataset.

You build the data theme into a template ``datapackage.json`` file which you can extend for your purpose.

A datatheme consists of a ``datatheme.json`` file which describes itself and paths to all schema resources referenced by this theme.

````
$ cat datatheme.json
{
    "name": "afgo.pgyi",
    "version": "2.0.1",
    "repository": "http://github.com/tesera/afgo-pgyi-datatheme.git",
    "description": "Data theme for AFGO PGYI forestry permanent sample plots.",
    "schemas": [
        "./schemas/plot.json",
        "./schemas/photo_avi.json",
        "./schemas/treatment.json",
        "./schemas/disturbance.json",
        "./schemas/regeneration.json",
        "./schemas/plot_measurement.json",
        "./schemas/trees.json",
        "./schemas/trees_measurement.json"
    ]
}
````

####Building your theme into a package template file.
````
$ node ./build.js > datapackage.json
````

#####Options:
````
node ./build.js <datatheme_name>
node ./build.js dev.afgo.pgyi
````
