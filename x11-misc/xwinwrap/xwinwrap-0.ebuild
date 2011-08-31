# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit cvs

DESCRIPTION="Consente all'utente di impostare un filmato oppure uno salvaschermo
come sfondo della scrivania."
HOMEPAGE="http://wiki.ubuntu-it.org/AmbienteGrafico/XwinWrap"
#SRC_URI=""
ECVS_SERVER="cvs.freedesktop.org:/cvs/xapps"
ECVS_USER="anoncvs"
ECVS_MODULE="${PN}"

LICENSE="custom-ldflags"
SLOT="0"
KEYWORDS="x86 amd64"
IUSE="cflags"

DEPEND="x11-libs/libX11 x11-libs/libXext x11-libs/libXrender"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${ECVS_MODULE}"

src_compile() {
	if use custom-ldflags; then
		ewarn "It's not recommended to use custom-ldflags"
		emake || die
	else
		LDFLAGS="" emake || die
	fi
}

src_install() {
	dobin xwinwrap
}
