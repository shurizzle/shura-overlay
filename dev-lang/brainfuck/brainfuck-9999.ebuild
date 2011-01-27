# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit git

EGIT_REPO_URI="git://github.com/shurizzle/brainfuck.git"

DESCRIPTION="A simple brainfuck interpreter"
HOMEPAGE="https://github.com/shurizzle/brainfuck"

LICENSE="AGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}"

src_configure() {
	:
}

src_compile() {
	emake || die
}

src_install() {
	emake PREFIX="/usr" DESTDIR="${D}" install || die
}
