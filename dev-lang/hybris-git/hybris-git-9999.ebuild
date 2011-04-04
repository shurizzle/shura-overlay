# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit git

DESCRIPTION="Hybris Programming Language"
HOMEPAGE="http://www.hybris-lang.org/"
EGIT_REPO_URI="git://github.com/evilsocket/hybris.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="${DEPEND}
	dev-util/cmake
	>=sys-devel/gcc-4.4.3
	dev-libs/libpcre
	dev-libs/libxml2:2
	dev-libs/libffi
	net-misc/curl
	!dev-lang/hybris"
RDEPEND="${RDEPEND} ${DEPEND}"

src_configure() {
	cmake . || die
}

src_compile() {
	emake || die
}

src_install() {
	emake DESTDIR="${D}" install || die
}
