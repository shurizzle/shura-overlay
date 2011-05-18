# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

inherit eutils

DESCRIPTION="Vaiofand is a Linux system daemon to tame the noisy fans of Sony Vaio laptops."
HOMEPAGE="http://vaio-utils.org/fan/"
SRC_URI="http://vaio-utils.org/download/${P}.tar.gz"

LICENSE="ICS"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare() {
	sed -i s:/usr/local:/usr/:g Makefile
}

src_install() {
	emake DESTDIR="${D}" copy || die
	newinitd "${FILESDIR}/initd" "${PN}" || die
}

pkg_postinst() {
	enewuser vaiofand -1 -1 || die
}
