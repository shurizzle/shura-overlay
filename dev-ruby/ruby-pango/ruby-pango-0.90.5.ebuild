# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"
USE_RUBY="ruby18 ruby19"

inherit ruby-ng-gnome2

DESCRIPTION="Ruby Pango bindings"
KEYWORDS="alpha amd64 ia64 ppc sparc x86"
IUSE=""
DEPEND="${DEPEND}
	>=x11-libs/pango-1.28.1
	>=dev-ruby/rcairo-${PV}"
RDEPEND="${RDEPEND}
	>=x11-libs/pango-1.28.1
	>=dev-ruby/rcairo-1.10.0"

ruby_add_rdepend ">=dev-ruby/ruby-glib2-${PV}"
