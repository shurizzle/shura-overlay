# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2
USE_RUBY="ruby18 ruby19 jruby"

inherit ruby-fakegem

DESCRIPTION="Ruby bindings for libcurl."
HOMEPAGE="http://taf2.github.com/curb/"

LICENSE="|| ( Ruby GPL-2 )"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND="=net-misc/curl-7*"

each_ruby_configure() {
	pushd ext
		${RUBY} extconf.rb
	popd
}

each_ruby_compile() {
	pushd ext
		emake || die "Unable to compile extension."
	popd
}

each_ruby_install() {
	mv ext/curb_core.so lib || die "Unable to install extension."

	all_fakegem_install
}
