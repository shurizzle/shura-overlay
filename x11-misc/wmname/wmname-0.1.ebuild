# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

DESCRIPTION="wmname prints/sets the window manager name property of the root
window similar to how hostname(1) behaves."
HOMEPAGE="http://tools.suckless.org/wmname"
SRC_URI="http://dl.suckless.org/tools/wmname-0.1.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="x11-base/xorg-x11"
RDEPEND="${DEPEND}"

src_configure() {
	sed -i s:/usr/local:"${D}":g config.mk
}

src_compile() {
	emake || die
}

src_install() {
	dodoc README
	emake install || die
}
