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

echo "Building spec file: rpm/SPECS/harbor.spec"
sed -e "s/VERSION/$version/g" rpm/SPECS/harbor.spec.tmpl > rpm/SPECS/harbor.spec

rsync -uav --progress harbor-offline-installer-v${version}.tgz rpm/BUILD/

rpmbuild -bb rpm/SPECS/harbor.spec

