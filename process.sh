#!/bin/bash

set -e

# remove all files from the output directories
rm -rf dist

mkdir -p dist/geojson
mkdir -p dist/svg
mkdir -p dist/topojson

echo "Processing KOMMUNE.shp"
fields=REGIONKODE,REGIONNAVN,KOMKODE,KOMNAVN
ogr2ogr -f GeoJSON -t_srs crs:84 -select "$fields" -progress "./dist/geojson/dagi-2m-kommuner.geojson" "./dagi/DAGI2M/KOMMUNE.shp"
ogr2ogr -f GeoJSON -t_srs crs:84 -select "$fields" -progress "./dist/geojson/dagi-500-kommuner.geojson" "./dagi/DAGI500/KOMMUNE.shp"
ogr2ogr -f GeoJSON -t_srs crs:84 -select "$fields" -progress "./dist/geojson/dagi-ref-kommuner.geojson" "./dagi/DAGIREF/KOMMUNE.shp"

echo "Creating SVG"
node ./svg.js "./dist/geojson/dagi-2m-kommuner.geojson" kommuner KOMKODE KOMNAVN > "./dist/svg/dagi-2m-kommuner.svg"
node ./svg.js "./dist/geojson/dagi-500-kommuner.geojson" kommuner KOMKODE KOMNAVN > "./dist/svg/dagi-500-kommuner.svg"
node ./svg.js "./dist/geojson/dagi-ref-kommuner.geojson" kommuner KOMKODE KOMNAVN > "./dist/svg/dagi-ref-kommuner.svg"

echo "Creating TopoJSON"
topojson -o "./dist/topojson/dagi-2m-kommuner.json" --id-property=KOMKODE -p id=KOMKODE -p name=KOMNAVN -- "./dist/geojson/dagi-2m-kommuner.geojson"
topojson -o "./dist/topojson/dagi-500-kommuner.json" --id-property=KOMKODE -p id=KOMKODE -p name=KOMNAVN -- "./dist/geojson/dagi-500-kommuner.geojson"
topojson -o "./dist/topojson/dagi-ref-kommuner.json" --id-property=KOMKODE -p id=KOMKODE -p name=KOMNAVN -- "./dist/geojson/dagi-ref-kommuner.geojson"


echo "Processing OPSTILKR.shp"
fields=OPSTILKRNR,OPSTILNAVN,VALGKRNR,STORKRNR,STORKRNAVN,LANDSDELNR,LANDSNAVN
ogr2ogr -f GeoJSON -t_srs crs:84 -select "$fields" -progress "./dist/geojson/dagi-2m-opstillingskredse.geojson" "./dagi/DAGI2M/OPSTILKR.shp"
ogr2ogr -f GeoJSON -t_srs crs:84 -select "$fields" -progress "./dist/geojson/dagi-500-opstillingskredse.geojson" "./dagi/DAGI500/OPSTILKR.shp"
ogr2ogr -f GeoJSON -t_srs crs:84 -select "$fields" -progress "./dist/geojson/dagi-ref-opstillingskredse.geojson" "./dagi/DAGIREF/OPSTILKR.shp"

echo "Creating SVG"
node ./svg.js "./dist/geojson/dagi-2m-opstillingskredse.geojson" opstillingskredse OPSTILKRNR OPSTILKRNAVN > "./dist/svg/dagi-2m-opstillingskredse.svg"
node ./svg.js "./dist/geojson/dagi-500-opstillingskredse.geojson" opstillingskredse OPSTILKRNR OPSTILKRNAVN > "./dist/svg/dagi-500-opstillingskredse.svg"
node ./svg.js "./dist/geojson/dagi-ref-opstillingskredse.geojson" opstillingskredse OPSTILKRNR OPSTILKRNAVN > "./dist/svg/dagi-ref-opstillingskredse.svg"

echo "Creating TopoJSON"
topojson -o "./dist/topojson/dagi-2m-opstillingskredse.json" --id-property=OPSTILKRNR -p id=OPSTILKRNR -p name=OPSTILKRNAVN -- "./dist/geojson/dagi-2m-opstillingskredse.geojson"
topojson -o "./dist/topojson/dagi-500-opstillingskredse.json" --id-property=OPSTILKRNR -p id=OPSTILKRNR -p name=OPSTILKRNAVN -- "./dist/geojson/dagi-500-opstillingskredse.geojson"
topojson -o "./dist/topojson/dagi-ref-opstillingskredse.json" --id-property=OPSTILKRNR -p id=OPSTILKRNR -p name=OPSTILKRNAVN -- "./dist/geojson/dagi-ref-opstillingskredse.geojson"


echo "Processing POLITIKR.shp"
fields=POLKR_NR,POLKR_NAVN,MYND_KODE
ogr2ogr -f GeoJSON -t_srs crs:84 -select "$fields" -progress "./dist/geojson/dagi-2m-politikredse.geojson" "./dagi/DAGI2M/POLITIKR.shp"
ogr2ogr -f GeoJSON -t_srs crs:84 -select "$fields" -progress "./dist/geojson/dagi-500-politikredse.geojson" "./dagi/DAGI500/POLITIKR.shp"
ogr2ogr -f GeoJSON -t_srs crs:84 -select "$fields" -progress "./dist/geojson/dagi-ref-politikredse.geojson" "./dagi/DAGIREF/POLITIKR.shp"

echo "Creating SVG"
node ./svg.js "./dist/geojson/dagi-2m-politikredse.geojson" politikredse POLKR_NR POLKR_NAVN > "./dist/svg/dagi-2m-politikredse.svg"
node ./svg.js "./dist/geojson/dagi-500-politikredse.geojson" politikredse POLKR_NR POLKR_NAVN > "./dist/svg/dagi-500-politikredse.svg"
node ./svg.js "./dist/geojson/dagi-ref-politikredse.geojson" politikredse POLKR_NR POLKR_NAVN > "./dist/svg/dagi-ref-politikredse.svg"

echo "Creating TopoJSON"
topojson -o "./dist/topojson/dagi-2m-politikredse.json" --id-property=POLKR_NR -p id=POLKR_NR -p name=POLKR_NAVN -- "./dist/geojson/dagi-2m-politikredse.geojson"
topojson -o "./dist/topojson/dagi-500-politikredse.json" --id-property=POLKR_NR -p id=POLKR_NR -p name=POLKR_NAVN -- "./dist/geojson/dagi-500-politikredse.geojson"
topojson -o "./dist/topojson/dagi-ref-politikredse.json" --id-property=POLKR_NR -p id=POLKR_NR -p name=POLKR_NAVN -- "./dist/geojson/dagi-ref-politikredse.geojson"


echo "Processing POSTNUMMER.shp"
fields=POSTNR_TXT,POSTBYNAVN,POSTNR_FRA,POSTNR_TIL
ogr2ogr -f GeoJSON -t_srs crs:84 -select "$fields" -progress "./dist/geojson/dagi-2m-postnumre.geojson" "./dagi/DAGI2M/POSTNUMMER.shp"
ogr2ogr -f GeoJSON -t_srs crs:84 -select "$fields" -progress "./dist/geojson/dagi-500-postnumre.geojson" "./dagi/DAGI500/POSTNUMMER.shp"
ogr2ogr -f GeoJSON -t_srs crs:84 -select "$fields" -progress "./dist/geojson/dagi-ref-postnumre.geojson" "./dagi/DAGIREF/POSTNUMMER.shp"

echo "Creating SVG"
node ./svg.js "./dist/geojson/dagi-2m-postnumre.geojson" postnumre POSTNR_TXT POSTBYNAVN > "./dist/svg/dagi-2m-postnumre.svg"
node ./svg.js "./dist/geojson/dagi-500-postnumre.geojson" postnumre POSTNR_TXT POSTBYNAVN > "./dist/svg/dagi-500-postnumre.svg"
node ./svg.js "./dist/geojson/dagi-ref-postnumre.geojson" postnumre POSTNR_TXT POSTBYNAVN > "./dist/svg/dagi-ref-postnumre.svg"

echo "Creating TopoJSON"
topojson -o "./dist/topojson/dagi-2m-postnumre.json" --id-property=POSTNR_TXT -p id=POSTNR_TXT -p name=POSTBYNAVN -- "./dist/geojson/dagi-2m-postnumre.geojson"
topojson -o "./dist/topojson/dagi-500-postnumre.json" --id-property=POSTNR_TXT -p id=POSTNR_TXT -p name=POSTBYNAVN -- "./dist/geojson/dagi-500-postnumre.geojson"
topojson -o "./dist/topojson/dagi-ref-postnumre.json" --id-property=POSTNR_TXT -p id=POSTNR_TXT -p name=POSTBYNAVN -- "./dist/geojson/dagi-ref-postnumre.geojson"


echo "Processing REGION.shp"
fields=REGIONKODE,REGIONNAVN
ogr2ogr -f GeoJSON -t_srs crs:84 -select "$fields" -progress "./dist/geojson/dagi-2m-regioner.geojson" "./dagi/DAGI2M/REGION.shp"
ogr2ogr -f GeoJSON -t_srs crs:84 -select "$fields" -progress "./dist/geojson/dagi-500-regioner.geojson" "./dagi/DAGI500/REGION.shp"
ogr2ogr -f GeoJSON -t_srs crs:84 -select "$fields" -progress "./dist/geojson/dagi-ref-regioner.geojson" "./dagi/DAGIREF/REGION.shp"

echo "Creating SVG"
node ./svg.js "./dist/geojson/dagi-2m-regioner.geojson" regioner REGIONKODE REGIONNAVN > "./dist/svg/dagi-2m-regioner.svg"
node ./svg.js "./dist/geojson/dagi-500-regioner.geojson" regioner REGIONKODE REGIONNAVN > "./dist/svg/dagi-500-regioner.svg"
node ./svg.js "./dist/geojson/dagi-ref-regioner.geojson" regioner REGIONKODE REGIONNAVN > "./dist/svg/dagi-ref-regioner.svg"

echo "Creating TopoJSON"
topojson -o "./dist/topojson/dagi-2m-regioner.json" --id-property=REGIONKODE -p id=REGIONKODE -p name=REGIONNAVN -- "./dist/geojson/dagi-2m-regioner.geojson"
topojson -o "./dist/topojson/dagi-500-regioner.json" --id-property=REGIONKODE -p id=REGIONKODE -p name=REGIONNAVN -- "./dist/geojson/dagi-500-regioner.geojson"
topojson -o "./dist/topojson/dagi-ref-regioner.json" --id-property=REGIONKODE -p id=REGIONKODE -p name=REGIONNAVN -- "./dist/geojson/dagi-ref-regioner.geojson"


echo "Processing RETSKR.shp"
fields=MYND_KODE,RETSKRNR,RETSKRNAVN
ogr2ogr -f GeoJSON -t_srs crs:84 -select "$fields" -progress "./dist/geojson/dagi-2m-retskredse.geojson" "./dagi/DAGI2M/RETSKR.shp"
ogr2ogr -f GeoJSON -t_srs crs:84 -select "$fields" -progress "./dist/geojson/dagi-500-retskredse.geojson" "./dagi/DAGI500/RETSKR.shp"
ogr2ogr -f GeoJSON -t_srs crs:84 -select "$fields" -progress "./dist/geojson/dagi-ref-retskredse.geojson" "./dagi/DAGIREF/RETSKR.shp"

echo "Creating SVG"
node ./svg.js "./dist/geojson/dagi-2m-retskredse.geojson" retskredse RETSKRNR RETSKRNAVN > "./dist/svg/dagi-2m-retskredse.svg"
node ./svg.js "./dist/geojson/dagi-500-retskredse.geojson" retskredse RETSKRNR RETSKRNAVN > "./dist/svg/dagi-500-retskredse.svg"
node ./svg.js "./dist/geojson/dagi-ref-retskredse.geojson" retskredse RETSKRNR RETSKRNAVN > "./dist/svg/dagi-ref-retskredse.svg"

echo "Creating TopoJSON"
topojson -o "./dist/topojson/dagi-2m-retskredse.json" --id-property=RETSKRNR -p id=RETSKRNR -p name=RETSKRNAVN -- "./dist/geojson/dagi-2m-retskredse.geojson"
topojson -o "./dist/topojson/dagi-500-retskredse.json" --id-property=RETSKRNR -p id=RETSKRNR -p name=RETSKRNAVN -- "./dist/geojson/dagi-500-retskredse.geojson"
topojson -o "./dist/topojson/dagi-ref-retskredse.json" --id-property=RETSKRNR -p id=RETSKRNR -p name=RETSKRNAVN -- "./dist/geojson/dagi-ref-retskredse.geojson"


echo "Processing SOGN.shp"
fields=SOGNEKODE,SOGNENAVN
ogr2ogr -f GeoJSON -t_srs crs:84 -select "$fields" -progress "./dist/geojson/dagi-2m-sogne.geojson" "./dagi/DAGI2M/SOGN.shp"
ogr2ogr -f GeoJSON -t_srs crs:84 -select "$fields" -progress "./dist/geojson/dagi-500-sogne.geojson" "./dagi/DAGI500/SOGN.shp"
ogr2ogr -f GeoJSON -t_srs crs:84 -select "$fields" -progress "./dist/geojson/dagi-ref-sogne.geojson" "./dagi/DAGIREF/SOGN.shp"

echo "Creating SVG"
node ./svg.js "./dist/geojson/dagi-2m-sogne.geojson" sogne SOGNEKODE SOGNENAVN > "./dist/svg/dagi-2m-sogne.svg"
node ./svg.js "./dist/geojson/dagi-500-sogne.geojson" sogne SOGNEKODE SOGNENAVN > "./dist/svg/dagi-500-sogne.svg"
node ./svg.js "./dist/geojson/dagi-ref-sogne.geojson" sogne SOGNEKODE SOGNENAVN > "./dist/svg/dagi-ref-sogne.svg"

echo "Creating TopoJSON"
topojson -o "./dist/topojson/dagi-2m-sogne.json" --id-property=SOGNEKODE -p id=SOGNEKODE -p name=SOGNENAVN -- "./dist/geojson/dagi-2m-sogne.geojson"
topojson -o "./dist/topojson/dagi-500-sogne.json" --id-property=SOGNEKODE -p id=SOGNEKODE -p name=SOGNENAVN -- "./dist/geojson/dagi-500-sogne.geojson"
topojson -o "./dist/topojson/dagi-ref-sogne.json" --id-property=SOGNEKODE -p id=SOGNEKODE -p name=SOGNENAVN -- "./dist/geojson/dagi-ref-sogne.geojson"
