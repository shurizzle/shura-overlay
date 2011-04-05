# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

DESCRIPTION="tool that allows any number of clients behind NATs to communicate with a server behind a separate NAT with *no* port forwarding and *no* DMZ setup"
HOMEPAGE="http://samy.pl/pwnat/"
SRC_URI="http://samy.pl/pwnat/pwnat-0.3-beta.tgz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

S="${WORKDIR}/${P}-beta"

src_compile() {
	emake || die
}

src_install() {
	mkdir -p "${D}/usr/bin"
	chmod +s pwnat
	cp pwnat "${D}/usr/bin"
}
