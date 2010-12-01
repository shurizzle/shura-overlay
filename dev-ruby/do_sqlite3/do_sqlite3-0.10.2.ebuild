# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2
USE_RUBY="ruby18 ruby19 jruby"

inherit ruby-fakegem

DESCRIPTION="Implements the DataObjects API for Sqlite3"
HOMEPAGE="http://rubydoc.info/gems/do_sqlite3/0.10.2/frames"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="dev"

ruby_add_rdepend ">=dev-ruby/data_objects-0.10.2"

each_ruby_configure() {
	pushd ext/do_sqlite3
		${RUBY} extconf.rb || die "extconf failed"
	popd
}

each_ruby_compile() {
	(use ruby_targets_jruby) && return 0
	(use ruby_targets_ree18) && return 0

	pushd ext/do_sqlite3
		emake || die "make failed"
	popd

	cp ext/do_sqlite3/do_sqlite3$(get_modname) lib/do_sqlite3 || die
}
