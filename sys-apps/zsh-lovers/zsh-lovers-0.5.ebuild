# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

DESCRIPTION="tips, tricks and examples for the Z shell"
HOMEPAGE="http://manpages.ubuntu.com/manpages/hardy/man1/zsh-lovers.1.html"
SRC_URI="http://manpages.ubuntu.com/manpages.gz/hardy/man1/zsh-lovers.1.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86 ~amd64"

S="${WORKDIR}"

src_install() {
	doman zsh-lovers.1
}
