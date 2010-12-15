# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

DESCRIPTION="Repo is a tool that helps manage the many Git repositories of Android"
HOMEPAGE="http://source.android.com/source/git-repo.html"
SRC_URI="http://android.git.kernel.org/repo"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="dev-vcs/git"

S="${WORKDIR}"

src_unpack() {
	cp "${DISTDIR}/${A}" repo || die
}

src_install() {
	exeinto /usr/bin
	doexe repo || die
}
