Danmarks Administrative Geografiske Inddeling
=============================================

This repository contains the tools we use to convert the DAGI data to GeoJSON, SVG, and TopoJSON. The latest version of the processed data is available at [lab.information.dk](http://lab.information.dk/).


Requirements
------------

First of all, you need to download the DAGI shape files from [Kortforsyningen](http://download.kortforsyningen.dk/content/geodataprodukter?field_korttype_tid_1=442). Then you need to install the following packages:

* `ogr2ogr` (part of the [GDAL](http://www.gdal.org/) library)
* D3.js
* JSDom
* TopoJSON

You can install the last three tools by running `npm install` in the root of this repository. See the `package.json` file for the required version numbers.


Supported fields
----------------

### KOMMUNE.shp

* Kommunenummer
* Kommunenavn
* Regionsnummer
* Regionsnavn


### OPSTILKR.shp

* Opstillingskredsnummer
* Opstillingskredsnavn
* Valgkredsnummer
* Storkredsnummer
* Storkredsnavn
* Landsdelsnummer
* Landsdelsnavn

### POLITIKR.shp

* Politikredsnummer
* Politikredsnavn
* Myndighedskode

### POSTNUMMER.shp

* Postnummertekst
* By
* Postnummer fra
* Postnummer til

### REGION.shp

* Regionskode
* Regionsnavn

### RETSKR.shp

* Retskredsnummer
* Retskredsnavn
* Myndighedskode

### SOGN.shp

* Sognekode
* Sognenavn
