#!/bin/bash

for year in 2011 2016 ; do
    if [ -d 02-ASGS-UNZIP/1270055001_mb_${year}_nsw_shape ] ; then
        dest_dir="02-ASGS-UNZIP/1270055001_mb_${year}_aust_shape"
        dest_layer="MB_${year}_AUST"

        if [ ! -z "${dest_dir}" ] ; then
            rm -rf "${dest_dir}/"
        fi
        mkdir -p "${dest_dir}"

        i=0
        for src_file in 02-ASGS-UNZIP/1270055001_mb_${year}_*_shape/MB_${year}_*.shp ; do
            echo "${src_file}"

            if [ $i -eq 0 ] ; then
                ogr2ogr "${dest_dir}/${dest_layer}.shp" "${src_file}"
            else
                ogr2ogr -update -append "${dest_dir}/${dest_layer}.shp" "${src_file}" -nln "${dest_layer}"
            fi

            i=$((i+1))
        done
    else
        echo "Skip merging MB ${year} as no downloads exist"
    fi
done
