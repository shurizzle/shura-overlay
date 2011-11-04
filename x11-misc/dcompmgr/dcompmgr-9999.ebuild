# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit git

DESCRIPTION="X Compositing manager"
HOMEPAGE=""
EGIT_REPO_URI="git://git.openbox.org/dana/dcompmgr"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~ppc ~ppc64 ~sparc ~x86"
IUSE=""
RDEPEND="x11-libs/libXrender
	x11-libs/libXdamage
	x11-libs/libXcomposite
	x11-libs/libxcb"
DEPEND="${RDEPEND}"

src_configure() {
	:
}

src_install() {
	dobin dcompmgr
}
