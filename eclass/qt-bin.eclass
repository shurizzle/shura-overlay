# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $
#
# @ECLASS: qt-bin.eclass
# @MAINTAINER:
# Author: shura <shura1991@gmail.com>
#
# @BLURB: An eclass that make you happy.
# @DESCRIPTION:
# This eclass simplify working with shit.
#

inherit multilib

EXPORT_FUNCTIONS pkg_setup

IUSE="${IUSE} +qt qt-bin"

RDEPEND="${RDEPEND}
	qt-bin? ( x11-libs/qt-bin )"

# @FUNCTION: qt-dir
# @DESCRIPTION:
# Return Qt's directory
qt-dir() {
	echo -n /usr/$(get_libdir)/qt
	use qt && echo -n 4
}

# @FUNCTION: qt-bin_check_qt
# @DESCRIPTION:
# Check use flags
qt-bin_check_qt() {
	if ! use qt && ! use qt-bin; then
		die "You must install Qt library."
	fi

	if use qt && use qt-bin; then
		die "You have to choose between qt and qt-bin"
	fi
}

# @FUNCTION: qt-bin_pkg_setup
# @DESCRIPTION:
# Call qt-bin_check_qt
qt-bin_pkg_setup() {
	qt-bin_check_qt
}

# @FUNCTION: qt_deps_add
# @DESCRIPTION:
# Insert all qt packages needed
qt_deps_add() {
	RDEPEND="${RDEPEND}
	qt? ( ${1} )"
}
