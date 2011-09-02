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
	sed -i 's:from IN:from _testcapi:' usbcreator/misc.py

	if ! use kde; then
		epatch "${FILESDIR}/gtk-only.patch"
	fi
}

#src_compile() {
	#python2.7 setup.py build || die
#}

#src_install() {
	#python2.7 setup.py install \
		#--home="${D}" \
		#--install-scripts="${D}/usr/bin" \
		#--install-lib="${D}/usr/lib/python2.7" || die
#}
