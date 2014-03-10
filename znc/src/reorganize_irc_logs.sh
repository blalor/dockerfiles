#!/bin/bash

cd /var/lib/znc/users/

for log_dir in */moddata/log; do
    pushd "${log_dir}" >/dev/null

    find . -maxdepth 1 -type f -ctime +1 -name '*.log' | while read x ; do
        d=$( echo "$x" | sed -r -e 's#.*_(.{4})(.{2})(.{2})\.log#\1/\2/\3#g' )
        f="${d}/$( basename ${x} )"

        if [ ! -d "${d}" ]; then
            mkdir -p $d
        fi

        if [ ! -e "${f}" ]; then
            mv "${x}" "${f}"
            gzip "${f}"
        fi
    done

    popd >/dev/null
done
