# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="1"

inherit eutils mercurial

DESCRIPTION="A semi-automatic tiling window manager"
HOMEPAGE="http://subforge.org/projects/subtle"
EHG_REPO_URI="http://hg.subforge.org/subtle"
LICENSE="GPL-2"

SLOT="0"
KEYWORDS="~amd64 ~arm ~hppa ~ia64 ~mips ~ppc ~ppc64 ~s390 ~sparc ~x86 ~x86-fbsd ~amd64-linux ~x86-linux ~ppc-macos ~x64-macos ~x86-macos ~sparc-solaris ~sparc64-solaris ~x64-solaris ~x86-solaris"
IUSE="debug doc xft xinerama xrandr"
RDEPEND="x11-libs/libX11
		dev-lang/ruby:1.9
        >=sys-devel/gcc-4.3
        dev-vcs/mercurial
        dev-ruby/rake
		xft? ( x11-libs/libXft )
		xinerama? ( x11-libs/libXinerama )
		xrandr? ( x11-libs/libXrandr )"

DEPEND="${RDEPEND}
		dev-ruby/tilt
		dev-ruby/haml
		>=dev-ruby/curb-0.5.1.0
		>=dev-ruby/archive-tar-minitar-0.5.2
		>=dev-ruby/datamapper-0.9.11
		>=dev-ruby/sinatra-0.9.4"

S="${WORKDIR}/${PN}"


src_compile() {
	local myconf
	export XDG_DATA_DIRS="/usr/share"

	if use xft; then
		myconf="xft=yes"
	else
		myconf="xft=no"
	fi

	if use xinerama; then
		myconf="${myconf} xinerama=yes"
	else
		myconf="${myconf} xinerama=no"
	fi

	if use xrandr; then
		myconf="${myconf} randr=yes"
	else
		myconf="${myconf} randr=no"
	fi

	if use debug; then
		myconf="${myconf} debug=yes"
	else
		myconf="${myconf} debug=no"
	fi

	rake destdir="${D}" $myconf config || die "Configure failed"
	rake build || die "Build failed"
	if use doc; then
		rake rdoc || die "Rdoc failed"
	fi
}

src_install() {
	cat <<'EOF' > subtle.desktop
[Desktop Entry]
Encoding=UTF-8
Name=subtle
Comment=subtle tiling window manager
Exec=subtle
Type=XSession
EOF
	rake install || die "Install failed"
	insinto /usr/share/xsessions
	doins subtle.desktop || die
}
