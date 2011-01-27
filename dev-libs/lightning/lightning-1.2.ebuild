# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

DESCRIPTION="A library that generates assembly language code at run-time."
HOMEPAGE="http://www.gnu.org/software/lightning/"
SRC_URI="http://ftp.gnu.org/gnu/lightning/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"


src_configure() {
	econf || die
}

src_compile() {
	emake || die
}

src_install() {
	emake install || die
}
