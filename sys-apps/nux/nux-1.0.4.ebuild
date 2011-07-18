# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

DESCRIPTION="An OpenGL toolkit"
HOMEPAGE="https://launchpad.net/nux"
SRC_URI="http://launchpad.net/nux/1.0/1.0.4/+download/nux-1.0.4.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="
	>=dev-libs/glib-2.25.14
	x11-libs/gdk-pixbuf:2
	media-libs/glew[mx]
	dev-libs/libsigc++:2
	dev-util/gtest
	dev-util/gmock"
RDEPEND="${DEPEND}"

