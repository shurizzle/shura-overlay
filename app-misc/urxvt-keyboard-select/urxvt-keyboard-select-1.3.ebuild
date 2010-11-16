# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

MY_P=${P/urxvt-/}
MY_PN=${PN/urxvt-/}

DESCRIPTION="Use keyboard shortcuts to select and copy text."
HOMEPAGE="http://github.com/muennich/urxvt-perls"
SRC_URI="http://github.com/downloads/muennich/urxvt-perls/${MY_P}.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="x86 ~x86 amd64 ~amd64"
IUSE=""

DEPEND=""
RDEPEND="x11-terms/rxvt-unicode[perl]"

src_unpack() {
	unpack ${A}
}

src_install() {
	diropts -m644
	dodir /usr/lib/urxvt/perl
	insinto /usr/lib/urxvt/perl
	doins "${MY_P}/${MY_PN}"
}
