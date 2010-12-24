# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

DESCRIPTION="A live DJing system for the Jack sound server architecture. The system includes players for various audio file formats and playlist management."
HOMEPAGE="http://djplay.sourceforge.net/"
SRC_URI="http://downloads.sourceforge.net/project/djplay/${PN}/${PV}/${P}.tar.gz"

LICENSE="GPLv3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="virtual/libusb"
RDEPEND="${DEPEND}"

src_configure() {
	econf --prefix=/usr || die
}

src_compile() {
	emake || die
}

src_install() {
	emake DESTDIR="${D}" install || die
}
