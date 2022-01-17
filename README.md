# About

This repository hosts a work initiated by GéoBretagne. The provided `vrt.sh` script
aims at consuming some [GDAL Virtual formats (VRT)](https://gdal.org/drivers/raster/vrt.html) files
and load the underlying datas into a dedicated PostGIS database.

# Example

See the `vrts/sample.vrt` file for an example:

```xml
<?xml version="1.0"?>
<OGRVRTDataSource>
  <OGRVRTLayer name="pr_n_projetsindustriels">
    <SrcDataSource>https://www.data.gouv.fr/fr/datasets/r/b5536fc9-eb1c-421f-bf73-fedad9508409</SrcDataSource>
    <SrcLayer>b5536fc9-eb1c-421f-bf73-fedad9508409</SrcLayer>
    <SrcSQL>SELECT * FROM "b5536fc9-eb1c-421f-bf73-fedad9508409"</SrcSQL>
    <Field name="nom_entreprise" src="entreprise" type="String"/>
    <Field name="type_entreprise" src="type_entreprise" type="String"/>
    <Field name="siren_entreprise" src="siren" type="String"/>
  </OGRVRTLayer>
</OGRVRTDataSource>
```

# Configuration via environment variables

The following environment variables are expected:

```
# export PGHOST="127.0.0.1"
# export PGPORT="5432"
# export PGUSER="georchestra"
# export PGDATABASE="georchestra"
# export PGCLIENTENCODING="utf8"
# export PGPASSWORD="georchestra"

# export ACTIVESCHEMA="public"
# export SOURCEDIR=vrts
```

The `vrt.sh` script is meant to be called regularly via a Cronjob (every 5 hours
or more, as the datasets will be downloaded and published again at each run),
with the previous variables defined.

# Docker

The provided `Dockerfile` is meant to build the `vrt-bot` image, and a build can be
triggered via `docker-compose`:

```
$ docker-compose build
```

A volume is declared, where the vrt files can be uploaded:

```
    volumes:
    - ./path/to/your/vrts:/home/app/vrts
```
