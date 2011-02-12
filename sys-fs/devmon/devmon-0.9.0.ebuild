# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

DESCRIPTION="Automounts and unmounts optical and removable drives using udisks"
HOMEPAGE="http://igurublog.wordpress.com/downloads/script-${PN}/"
SRC_URI="mirror://sourceforge/ig-scripts/${P}.sh"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+gtk"

DEPEND="sys-fs/udisks
	>=app-shells/bash-4
	gtk? ( gnome-extra/zenity )"
RDEPEND="${DEPEND}"

S="${WORKDIR}"

src_unpack() {
	cp "${DISTDIR}/${A}" "${PN}" || die
}

src_install() {
	exeinto /usr/bin
	doexe "${PN}"
}
