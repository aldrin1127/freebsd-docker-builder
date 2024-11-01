#!/bin/sh -e
FREEBSD_VERSION="$(curl -s https://download.freebsd.org/snapshots/amd64/ | ggrep -oP '(?<=href=")[^"/]+(?=/")' | grep -E '^1[4-9]\.[0-9]+-CURRENT' | sort -V | tail -1)"
for i in base lib32; do
    echo "downloading https://download.freebsd.org/snapshots/amd64/${FREEBSD_VERSION}/${i}.txz"
    wget -q "https://download.freebsd.org/snapshots/amd64/${FREEBSD_VERSION}/${i}.txz"
    echo "${i}.txz downloaded"
done
