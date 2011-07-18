# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

DESCRIPTION="A bitmap font for programming and terminal use, in two sizes"
HOMEPAGE="http://font.gohu.eu/"
SRC_URI="http://font.gohu.eu/${P}.tar.gz"

LICENSE="WTFPL"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

FONTDIR="/usr/share/fonts/100dpi"

DEPEND="x11-apps/mkfontscale
	x11-apps/mkfontdir
	x11-apps/xset
	media-libs/fontconfig"
RDEPEND="${DEPEND}"

recache() {
	einfo "Updating font cache..."
	fc-cache -fs
	mkfontscale "${FONTDIR}"
	mkfontdir "${FONTDIR}"
	xset fp rehash
}

src_install() {
	insinto "${FONTDIR}"
	doins *.pcf.gz
}

pkg_postinst() {
	recache
}

pkg_postrm() {
	recache
}
