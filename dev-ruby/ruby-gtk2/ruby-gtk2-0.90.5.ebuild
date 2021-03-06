# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-ruby/ruby-gtk2/ruby-gtk2-0.19.4.ebuild,v 1.5 2010/10/20 21:56:15 ranger Exp $

EAPI="2"
USE_RUBY="ruby18 ruby19"

inherit ruby-ng-gnome2

DESCRIPTION="Ruby Gtk2 bindings"
KEYWORDS="alpha amd64 ia64 ppc sparc x86"
IUSE=""

DEPEND="${DEPEND} >=x11-libs/gtk+-2"
RDEPEND="${RDEPEND} >=x11-libs/gtk+-2"

ruby_add_rdepend "dev-ruby/ruby-gdkpixbuf2
	>=dev-ruby/ruby-glib2-${PV}
	>=dev-ruby/ruby-pango-${PV}
	>=dev-ruby/ruby-atk-${PV}
	>=dev-ruby/rcairo-1.10.0"

S="${WORKDIR}/ruby-gnome2-all-${PV}/gtk2"
