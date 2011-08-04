# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
PACMAN_PACKAGE_NAME="virtualbox-additions"

inherit pacman

DESCRIPTION="The Qt toolkit is a comprehensive C++ application development framework"
HOMEPAGE="http://qt.nokia.com/"

LICENSE="|| ( LGPL-2.1 GPL-3 )"
SLOT="1"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="${DEPEND}"
RDEPEND="${RDEPEND}"

PACMAN_A="${PACMAN_PACKAGE}-any.pkg.tar.xz"
