#!/bin/sh


version=1.2.0

echo "Building spec file: rpm/SPECS/harbor.spec"
sed -e "s/VERSION/$version/g" rpm/SPECS/harbor.spec.tmpl > rpm/SPECS/harbor.spec

rsync -uav --progress harbor-offline-installer-v${version}.tgz rpm/BUILD/

rpmbuild -bb rpm/SPECS/harbor.spec

