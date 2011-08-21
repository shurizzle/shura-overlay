# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

DESCRIPTION="Simple tool that captures the contents of the visible portion of the Linux framebuffer device"
HOMEPAGE="http://www.rcdrummond.net/fbdump/"
SRC_URI="http://www.rcdrummond.net/fbdump/fbdump-0.4.2.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="x86 amd64"
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
	emake DESTDIR="${D}" install || die
}
