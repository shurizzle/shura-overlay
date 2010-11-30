# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-ruby/rcairo/rcairo-1.8.5-r1.ebuild,v 1.1 2010/09/29 18:03:40 graaff Exp $

EAPI=2

# ruby19 → fails, and even crashes Ruby
# jruby → cannot work, it's a compiled extension
USE_RUBY="ruby18 ruby19"

# Documentation depends on files that are not distributed.
RUBY_FAKEGEM_TASK_DOC=""

# Depends on test-unit-2 which is currently masked.
RUBY_FAKEGEM_TASK_TEST=""

RUBY_FAKEGEM_DOCDIR="doc"

RUBY_FAKEGEM_EXTRADOC="AUTHORS NEWS"

inherit multilib ruby-fakegem

IUSE=""

DESCRIPTION="Ruby bindings for cairo"
HOMEPAGE="http://cairographics.org/rcairo/"
SRC_URI="mirror://rubygems/cairo-${PV}.gem"

SLOT="0"
LICENSE="|| ( Ruby GPL-2 )"
KEYWORDS="~amd64 ~ia64 ~sparc ~x86"

RDEPEND="${RDEPEND}
	>=x11-libs/cairo-1.2.0[svg]
	>=x11-libs/cairo-1.10"
DEPEND="${DEPEND}
	>=x11-libs/cairo-1.2.0[svg]
	>=x11-libs/cairo-1.10
	dev-ruby/ruby-pkg-config"

ruby_add_bdepend "test? ( >=dev-ruby/test-unit-2.1.0-r1:2 )"

each_ruby_configure() {
	${RUBY} extconf.rb || die "extconf failed"
}

each_ruby_compile() {
	emake || die "make failed"

	cp ext/cairo/cairo$(get_modname) lib/ || die
}

all_ruby_install() {
	all_fakegem_install

	insinto /usr/share/doc/${PF}/samples
	doins -r samples/* || die "Cannot install sample files."
}

each_ruby_install() {
	each_fakegem_install

	insinto "$(ruby_rbconfig_value sitearchdir)"
	doins ext/cairo/*.h
}
