# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

#DESCRIPTION=""
#HOMEPAGE=""
SRC_URI="http://www.phpboxxx.org/app/paintr/linux/paintr.bin"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

S="${WORKDIR}"

src_unpack() {
	cp "${DISTDIR}/${A}" paintr || die
}

src_install() {
	exeinto /usr/bin
	doexe paintr || die
}
