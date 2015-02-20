# datatheme-afgo

> !WIP: this is work in progress.

A datatheme is a defined datapackage JSON table schema. The schema defines all the resources and fields for each resources. The dataheme can evolve. The intent is that each change will be versioned.

A datatheme consists of a datatheme.json file which describes itself like its version and paths to each resource schema.

````
{
    "name": "afgo",
    "version": "1.0",
    "repository": "http://github.com/tesera/afgo-datatheme.git",
    "author": "Yves Richard",
    "description": "Datatheme for AFGO PGYI tree plot data.",
    "schemas": [
        "./schemas/Admin.json",
        "./schemas/Plot.json",
        "./schemas/PhotoAVI.json",
        "./schemas/Treatment.json",
        "./schemas/Disturbance.json",
        "./schemas/Regeneration.json",
        "./schemas/PlotMeasurement.json",
        "./schemas/Trees.json",
        "./schemas/TreesMeasurement.json"
    ]
}
````

####Building into a datapackage.json file (datatheme to datapackage)
````
$ sh ./dt2dp.sh > datapackage.json
````
