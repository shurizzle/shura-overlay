# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit eutils distutils

DESCRIPTION=""
HOMEPAGE="https://launchpad.net/ubuntu/oneiric/+source/usb-creator"
SRC_URI="https://launchpad.net/ubuntu/oneiric/+source/usb-creator/${PV}/+files/${PN}_${PV}.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
IUSE="kde"

DEPEND="${DEPEND}
	dev-python/python-distutils-extra
	>=dev-util/debhelper-7.0.50
	kde? ( kde-base/kdesdk-scripts )"
RDEPEND="${RDEPEND}"

src_prepare() {
	distutils_src_prepare
	sed -i 's:from IN:from _testcapi:' usbcreator/misc.py || die 'sed failed'
	sed -i 's:/usr/lib/syslinux/mbr.bin:/usr/share/syslinux/mbr.bin:' \
		bin/usb-creator-helper || die 'sed failed'

	if ! use kde; then
		epatch "${FILESDIR}/gtk-only.patch"
	fi
}
