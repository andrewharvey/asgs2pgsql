#!/bin/bash

dest_dir="02-ASGS-UNZIP/1270055001_mb_2011_aust_shape"
dest_layer="MB_2011_AUST"

if [ ! -z "${dest_dir}" ] ; then
    rm -rf "${dest_dir}/"
fi
mkdir -p "${dest_dir}"

i=0
for src_file in 02-ASGS-UNZIP/1270055001_mb_2011_*_shape/MB_2011_*.shp ; do
    echo "${src_file}"

    if [ $i -eq 0 ] ; then
        ogr2ogr "${dest_dir}/${dest_layer}.shp" "${src_file}"
    else
        ogr2ogr -update -append "${dest_dir}/${dest_layer}.shp" "${src_file}" -nln "${dest_layer}"
    fi

    i=$((i+1))
done


