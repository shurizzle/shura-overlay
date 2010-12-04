# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2
USE_RUBY="ruby19"

inherit ruby-fakegem

DESCRIPTION="The sys-filesystem library provides an interface for gathering filesystem information, such as disk space and mount point data."
HOMEPAGE="http://www.rubyforge.org/projects/sysutils"
#SRC_URI=""

SLOT="0"
KEYWORDS="~amd64 ~x86"

ruby_add_bdepend "test? ( >=dev-ruby/test-unit-2.1.1 )"

each_ruby_configure() {
	pushd ext
		${RUBY} extconf.rb || die "extconf failed."
	popd
}

each_ruby_compile() {
	pushd ext
		emake
	popd

	mkdir -p lib/sys
	cp ext/filesystem$(get_modname) lib/sys || die
}
