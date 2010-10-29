# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit eutils

DESCRIPTION="An open source tool which allows you to flash ROMs on most current HTC devices."
HOMEPAGE="http://code.google.com/p/htc-flasher/"
SRC_URI="http://${PN}.googlecode.com/files/HTCFlasher-${PV}-1.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86"
IUSE="extras doc"

DEPEND="doc? ( dev-lang/perl )"
RDEPEND="gnome-extra/zenity
	x11-terms/xterm"

S="${WORKDIR}/HTCFlasher-${PV}"

src_unpack() {
	unpack "${A}"
}

src_compile() {
	rm Makefile src/Makefile RomKitchen/Makefile man/Makefile
	cp "${FILESDIR}/main" Makefile
	cp "${FILESDIR}/src" src/Makefile
	use extras && cp "${FILESDIR}/rom" RomKitchen/Makefile
	use doc && cp "${FILESDIR}/doc" man/Makefile

	emake || die "Unable to compile package."
	if use doc; then
		pushd man
		emake || die "Unable to generate doc."
		popd
	fi
	
	if use extras; then
		pushd RomKitchen
		emake || die "Unable to compile extras."
		popd
	fi
}

src_install() {
	emake DESTDIR="${D}" install || die "Unable to install files."

	if use extras; then
		pushd man
		emake DESTDIR="${D}" install || die "Unable to install extras"
		popd
	fi

	if use doc; then
		pushd RomKitchen
		emake DESTDIR="${D}" install || die "Unable to install doc."
		popd
	fi
}

pkg_postinst() {
	ewarn "Make sure that you have compiled kernel with
Device Drivers  ---> USB support  ---> USB Serial Converter support"

	ewarn "A list of supported devices is on
http://code.google.com/p/htc-flasher/wiki/SupportedDevices"
}
