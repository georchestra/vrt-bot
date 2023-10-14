#!/bin/bash

# support files in each $SOURCEDIR :
# download.list : prescript with wget/curl to download datas
# settings : env vars for this $SOURCEDIR
# onespecificvrt.vrt : describe a source
# onespecificvrt.vrt.sql : sql postscript

# stop if error
set -e

# variables d'environnement pour postgresql
# export PGHOST="127.0.0.1"
# export PGPORT="5432"
# export PGUSER="georchestra"
# export PGDATABASE="georchestra"
# export PGCLIENTENCODING="utf8"
# export PGPASSWORD="georchestra"

# schema cible
# export ACTIVESCHEMA="public"
# export SOURCEDIR=vrts

# horodatage pour commentaires
DATE=$(date "+%A %d/%m/%Y %H:%M:%S")



   if [ -n "$(ls -A $SOURCEDIR 2>/dev/null)" ]
   then
        cd "${SOURCEDIR}"

        # cycle vrt
        for vrt in *.vrt;
        do
            echo "import de ${SOURCEDIR}/${vrt} dans le schema ${ACTIVESCHEMA} de la base ${PGDATABASE}"
            /usr/bin/ogr2ogr \
                -f Postgresql \
                -overwrite \
                PG:"active_schema=${ACTIVESCHEMA}" "${vrt}" -lco SCHEMA=${ACTIVESCHEMA} -lco OVERWRITE=yes -lco GEOMETRY_NAME=geometry -nlt PROMOTE_TO_MULTI  -lco DESCRIPTION="import par ${JOB_NAME}/${BUILD_NUMBER} le ${DATE} - ${SOURCEDIR}/${vrt}"
            # post import sql
            if [ -f "${vrt}.sql" ]; then
                echo "script sql après import trouvé"
                source "settings"
                psql -f "${vrt}.sql"
                echo "script sql après import exécuté"

            fi
        done

    else
        echo "${SOURCEDIR} n'existe pas"
    fi
