# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

DESCRIPTION="Hybris Programming Language"
HOMEPAGE="http://www.hybris-lang.org/"
SRC_URI="https://download.github.com/evilsocket-hybris-v1.0b3-141-g07aec08.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	dev-util/cmake
	>=sys-devel/gcc-4.4.3
	dev-libs/libpcre
	dev-libs/libxml2:2
	dev-libs/libffi
	net-misc/curl"
RDEPEND="${DEPEND}"

S="${WORKDIR}/evilsocket-hybris-07aec08"

src_configure() {
	cmake . || die
}

src_compile() {
	emake || die
}

src_install() {
	emake DESTDIR="${D}" install || die
}
