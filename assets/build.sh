#!/usr/bin/env -S bash -e
PACKAGE_NAME=bees_${BEES_VERSION}-${PACKAGE_VERSION}

git clone https://github.com/Zygo/bees.git --branch v${BEES_VERSION}
cd ./bees
make -j

mkdir -p /srv/${PACKAGE_NAME}/usr/lib/bees \
&& mkdir -p /srv/${PACKAGE_NAME}/usr/sbin \
&& mkdir -p /srv/${PACKAGE_NAME}/usr/lib/systemd/system \
&& mkdir -p /srv/${PACKAGE_NAME}/etc/bees \
&& mkdir -p /srv/${PACKAGE_NAME}/DEBIAN

cp bin/* /srv/${PACKAGE_NAME}/usr/lib/bees/bees \
&& cp scripts/beesd /srv/${PACKAGE_NAME}/usr/sbin/ \
&& chmod +x /srv/${PACKAGE_NAME}/usr/sbin/beesd \
&& cp scripts/beesd@.service /srv/${PACKAGE_NAME}/usr/lib/systemd/system/ \
&& cp scripts/beesd.conf.sample /srv/${PACKAGE_NAME}/etc/bees/


echo "Package: bees
Version: ${BEES_VERSION}-${PACKAGE_VERSION}
Section: base
Priority: optional
Architecture: amd64
Depends: util-linux (>= 2.38.1), btrfs-progs (>= 6.2), bash (>= 5.2.15), systemd (>= 252.22)
Maintainer: Johannes Rothmayr <johannes@rothmayr.com>
Description: BEES
 Best-Effort Extent-Same, a btrfs deduplication agent.
 Bees is written by Zygo, source-code available at https://github.com/Zygo/bees/" > /srv/${PACKAGE_NAME}/DEBIAN/control

dpkg-deb --build /srv/${PACKAGE_NAME}
rm -r /srv/${PACKAGE_NAME}
