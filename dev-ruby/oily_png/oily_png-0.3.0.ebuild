# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2
USE_RUBY="ruby18 ruby19 jruby"

inherit ruby-fakegem

DESCRIPTION="Native mixin to speed up ChunkyPNG."
HOMEPAGE="http://wiki.github.com/wvanbergen/oily_png"
SRC_URI="http://gems.rubyforge.org/gems/${P}.gem"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

ruby_add_bdepend ">=dev-ruby/chunky_png-0.12.0"

each_ruby_configure() {
	pushd ext/oily_png
		${RUBY} extconf.rb
	popd
}

each_ruby_compile() {
	pushd ext/oily_png
		emake || die "Unable to compile extension."
	popd
}

each_ruby_install() {
	mv ext/oily_png/oily_png$(get_modname) lib || die "Unable to install extension."

	each_fakegem_install
	all_fakegem_install
}
