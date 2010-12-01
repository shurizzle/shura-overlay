# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2
USE_RUBY="ruby18 ruby19"

inherit ruby-fakegem

IUSE=""
DESCRIPTION="Define file systems right in Ruby"
HOMEPAGE="http://rubyforge.org/projects/fusefs/"
SRC_URI="mirror://rubygems/fusefs-${PV}.gem"

SLOT="0"
KEYWORDS="~amd64 ~ia64 ~ppc64 ~x86"

DEPEND="${DEPEND} >=sys-fs/fuse-2.3"

each_ruby_configure() {
	epatch "${FILESDIR}/fusefs-ruby19.patch"
	pushd ext
		${RUBY} extconf.rb || die "extconf failed"
	popd
}

each_ruby_compile() {
	pushd ext
		emake || die "compile failed"
	popd

	cp ext/fusefs_lib$(get_modname) lib || die
}
