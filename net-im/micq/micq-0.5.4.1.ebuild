# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

#DESCRIPTION=""
#HOMEPAGE=""
SRC_URI="http://packages.sw.be/${PN}/${P}-1.rf.src.rpm"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+iconv +ssl gnutls +tcl"

DEPEND="app-arch/rpm2targz"
RDEPEND="${DEPEND}
	iconv? ( virtual/libiconv )
	gnutls? ( net-libs/gnutls )
	ssl? ( dev-libs/openssl )
	tcl? ( >=dev-lang/tcl-8.3 )"

src_unpack() {
	rpm2targz "${DISTDIR}/${A}" || die "Can't transform rpm package"
	unpack "./${P}-1.rf.src.tar.gz" || die
	unpack "./${P}.tgz" || die
}

src_configure() {
	local ICONV
	local SSL
	local TCL

	use iconv && ICONV="--enable-iconvrepl" || ICONV="--disable-iconv"
	if ! use ssl && ! use gnutls; then
		SSL="--disable-ssl"
	else
		SSL="--enable-ssl=$(use gnutls && echo "gnutls")$(use ssl && (use gnutls && echo ","; echo "openssl"))"
	fi
	use tcl || TCL="--disable-tcl"

	econf $ICONV $SSL $TCL --disable-dependency-tracking || die
}

src_install() {
	emake DESTDIR="${D}" install || die
}
