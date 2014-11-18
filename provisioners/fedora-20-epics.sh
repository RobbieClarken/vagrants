#!/usr/bin/env bash

epics_version="3.14.12.4"
profile_script=/etc/profile.d/epics.sh

echo "export EPICS_BASE=/opt/epics/base" >> "$profile_script"
echo "export EPICS_HOST_ARCH=linux-x86_64" >> "$profile_script"
echo "export PATH=\"\$EPICS_BASE/bin/\$EPICS_HOST_ARCH:\$PATH\"" >> "$profile_script"

. "$profile_script"

yum -y update
yum -y install gcc{,-c++} perl{,-devel} readline-devel perl-Pod-Checker
ln -s /usr/bin/xsubpp /usr/share/perl5/ExtUtils/
mkdir -p /opt/epics
cd /opt/epics
epics_tarball="baseR${epics_version}.tar.gz"
wget -nv -O "$epics_tarball" "http://www.aps.anl.gov/epics/download/base/$epics_tarball"
tar -xf "$epics_tarball"
ln -fs "${PWD}/base-${epics_version}" base
cd base
make
