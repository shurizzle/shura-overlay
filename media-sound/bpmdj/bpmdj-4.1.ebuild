# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit qt-bin

DESCRIPTION="BpmDj is a program to DJ with your Linux machine."
HOMEPAGE="http://bpmdj.sourceforge.net/"
SRC_URI="ftp://${PN}.yellowcouch.org/${PN}/${P}.source.tgz"

LICENSE="GPLv2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE+=" oss +alsa jack"

qt_rdeps_add "x11-libs/qt-gui:4"

DEPEND+=" sci-libs/fftw:3.0
	alsa? ( media-libs/alsa-lib media-sound/alsa-headers )
	jack? ( media-sound/jack-audio-connection-kit )"
RDEPEND="${DEPEND}"

pkg_setup() {
	qt-bin_check_qt

	if ! use oss && ! use alsa && ! use jack; then
		die "You must select at least and audio library."
	fi
}

src_prepare() {
	sed -i 's/text(NULL)/text((const char *)NULL)/' symbol.h
}

src_configure() {
	local BITS
	if hasq 'lm' "$(grep '^flags' /proc/cpuinfo | head -1 | sed -r 's/^.+?:\s*?//')"; then
		if $(uname -a | grep 64 &>/dev/null); then
			BITS=64
		else
			BITS=32
		fi
	else
		BITS=32
	fi

	local cFLAGS
	local LDFLAGS="$(pkg-config --libs fftw3)"

	if use oss; then
		cFLAGS="${cFLAGS} -D COMPILE_OSS"
	fi

	if use alsa; then
		cFLAGS="${cFLAGS} -D COMPILE_ALSA"
		LDFLAGS="${LDFLAGS} $(pkg-config --libs alsa)"
	fi

	if use jack; then
		cFLAGS="${cFLAGS} -D COMPILE_JACK"
		LDFLAGS="${LDFLAGS} $(pkg-config --libs jack)"
	fi

	cat <<EOF > defines
DISTCC_HOSTS	=
CPP				= ${CHOST}-g++ ${CFLAGS}
RCC				= rcc
UIC				= uic
MOC				= moc
CFLAGS		   += ${cFLAGS}
LDFLAGS			= ${LDFLAGS}
QT_INCLUDE_PATH	= -I/usr/include $(pkg-config --cflags QtGui)
QT_LIBRARY_PATH	= 
QT_LIBS			= -lQtGui
BITS			= ${BITS}
EOF
}

src_compile() {
	make || die
}

src_install() {
	dobin bos  bpmclock  bpmcount  bpmdj  bpmdjraw  bpmmerge  bpmplay \
		idx2txt  index-demo  profile-clock
}
