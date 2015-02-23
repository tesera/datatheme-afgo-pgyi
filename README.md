# datatheme-pgyi

> !WIP: this is work in progress.

A Datatheme is a defined [Tabular Datapackage](http://dataprotocols.org/tabular-data-package/). Essentially a Class from which you can base your Tabular Datapackage from. The intent is to have one place to define and version the data model using the [JSON Table Schema](http://dataprotocols.org/json-table-schema/).

You build the Datatheme into a base ``datapackage.json`` file which you can extend for your purpose.

PGYI is an initiative from the Alberta Forest Growth Organization (AFGO) to collect and share growth and yield plots data within their community.

A datatheme consists of a ``datatheme.json`` file which describes itself and paths to all schema resources referenced by this theme.

````
$ cat datatheme.json
{
    "name": "afgo.pgyi",
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
