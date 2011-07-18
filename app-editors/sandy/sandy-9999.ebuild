# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit mercurial

DESCRIPTION="ncurses text editor"
HOMEPAGE="http://tools.suckless.org/sandy"
SRC_URI=""

EHG_REPO_URI="http://hg.suckless.org/sandy"
S="${WORKDIR}/${EHG_REPO_URI##*/}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="sys-libs/ncurses"
RDEPEND="${DEPEND}"

src_configure() {
	sed -i -r \
		-e 's:(/usr)/local:\1:g' \
		-e 's:(CFLAGS = -ggdb -std=c99 -pedantic -Wall )-O0:\1:g' \
		-e 's:(LDFLAGS )= :\1+= :g' \
		config.mk || die 'sed failed'

	if use savedconfig; then
		restore_config config.h
	fi
}

src_compile() {
	local msg
	use savedconfig && msg=", please check the configfile"
	emake || die "emake failed${msg}"
}

src_install() {
	emake DESTDIR="${D}" install || die "install failed"
}
