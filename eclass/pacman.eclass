# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $
#
# @ECLASS: pacman.eclass
# @MAINTAINER:
# Author: shura <shura1991@gmail.com>
#
# @BLURB: An eclass to install pacman packages easily.
# @DESCRIPTION:
# This eclass allows to install pacman's (archlinux package manager) packages
# easily.
#

EXPORT_FUNCTIONS src_unpack src_install

# @ECLASS-VARIABLE: PACMAN_PACKAGE_NAME
# @DESCRIPTION:
# Sets package name.

# @ECLASS-VARIABLE: PACMAN_PACKAGE_VERSION
# @DESCRIPTION:
# Sets the version for the package.

# @ECLASS-VARIABLE: PACMAN_PACKAGE_RELEASE
# @DESCRIPTION:
# Sets the release for the package's version.

# @ECLASS-VARIABLE: PACMAN_PACKAGE
# @DESCRIPTION:
# PACMAN_PACKAGE="${PACMAN_PACKAGE_NAME}-${PACMAN_PACKAGE_VERSION}-${PACMAN_PACKAGE_RELEASE}"

PACMAN_PACKAGE_NAME="${PACMAN_PACKAGE_NAME:-${PN}}"
PACMAN_PACKAGE_VERSION="${PACMAN_PACKAGE_VERSION:-${PV}}"
PACMAN_PACKAGE_RELEASE="${PACMAN_PACKAGE_RELEASE:-${PR//r}}"
PACMAN_PACKAGE_RELEASE="${PACMAN_PACKAGE_RELEASE:-1}"
PACMAN_PACKAGE="${PACMAN_PACKAGE:-${PACMAN_PACKAGE_NAME}-${PACMAN_PACKAGE_VERSION}-${PACMAN_PACKAGE_RELEASE}}"

PACMAN_CACHE_DIR="${PACMAN_CACHE_DIR:-${DISTDIR}}"

DEPEND="${DEPEND} sys-apps/pacman"
RDEPEND="${RDEPEND} sys-apps/pacman"

# @FUNCTION: epacman
# @USAGE: <pacman's arguments>
# @DESCRIPTION:
# It's a wrapper of pacman to integrate it with portage.
# Please use it instead of pacman.
epacman() {
	local RES="$(pacman -r "${D}" --cachedir "${PACMAN_CACHE_DIR}" "$@")"
	[ $? -ne 0 ] && die "$(echo "${RES}" | grep '^error:')"
}

pacman_package_location() {
	pacman -Sdp "${PACMAN_PACKAGE_NAME}=${PACMAN_PACKAGE_VERSION}-${PACMAN_PACKAGE_RELEASE}" || \
		die "Can't retrieve package location."
}

# @FUNCTION: pacman_src_unpack
# @DESCRIPTION:
# Download package and unpack it.
pacman_src_unpack() {
	unpack "${A}"
}

# @FUNCTION: pacman_src_install
# @DESCRIPTION:
# Install files.
pacman_src_install() {
	cp -pR * "${D}"
}

SRC_URI="$(pacman_package_location)"
