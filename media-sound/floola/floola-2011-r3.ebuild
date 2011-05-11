# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

DESCRIPTION="Freeware application to efficiently manage your iPod"
HOMEPAGE="http://www.floola.com/home/main/"
SRC_URI="http://download1.schoonzie.com/Floola-linux.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="sys-libs/libstdc++-v3:5
	x11-libs/libnotify
	|| ( ( media-libs/gstreamer media-libs/gst-plugins-bad ) media-video/xine-ui )
	virtual/ffmpeg"
RDEPEND="${DEPEND}"

S="${WORKDIR}/Floola-linux"

src_compile() {
	:
}

src_install() {
	dodir /opt/floola
	mv Floola floola
	mv -f * "${D}/opt/floola"
	cat <<'EOF' > floola
#!/bin/bash
/opt/floola/floola "$@"
EOF
	dobin floola
}
