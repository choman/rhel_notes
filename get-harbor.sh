#!/bin/sh

BASE="https://github.com/vmware/harbor/releases"
LATEST="$BASE/latest"
DOWNLOAD="$BASE/download"

hdownload=$(curl -s $LATEST | \
                    grep -o '<a href=['"'"'"][^"'"'"']*['"'"'"]' | \
                    sed -e 's/^<a href=["'"'"']//' -e 's/["'"'"']$//')

version=$(basename $hdownload)
link="$DOWNLOAD/$version/harbor-offline-installer-${version}.tgz"

#filter "v"
version=$(echo $version | sed -e 's/v//')
echo $hdownload
echo $link
echo https://github.com/vmware/harbor/releases/download/v1.2.0/harbor-offline-installer-v1.2.0.tgz
echo $version


wget -c -N $link

