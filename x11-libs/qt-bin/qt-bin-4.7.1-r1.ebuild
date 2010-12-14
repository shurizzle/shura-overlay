# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
PACMAN_PACKAGE_NAME="qt"

inherit pacman

DESCRIPTION="The Qt toolkit is a comprehensive C++ application development framework"
HOMEPAGE="http://qt.nokia.com/"

LICENSE="|| ( LGPL-2.1 GPL-3 )"
SLOT="4"
KEYWORDS="~amd64 ~x86"
IUSE="postgres mysql odbc xinerama xcursor xfixes"

DEPEND="${DEPEND}"
RDEPEND="${RDEPEND} media-libs/tiff
	media-libs/libpng
	media-libs/libmng
	dev-db/sqlite:3
	app-misc/ca-certificates
	dev-libs/glib:2
	sys-apps/dbus
	media-libs/fontconfig
	virtual/opengl
	x11-libs/libSM
	x11-libs/libXrandr
	x11-libs/libXv
	x11-libs/libXi
	media-libs/alsa-lib
	x11-misc/xdg-utils
	x11-themes/hicolor-icon-theme
	postgres? ( dev-db/postgresql-base )
	mysql? ( virtual/mysql )
	odbc? ( dev-db/unixODBC )
	xinerama? ( x11-libs/libXinerama )
	xcursor? ( x11-libs/libXcursor )
	xfixes? ( x11-libs/libXfixes )"
