# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"
USE_RUBY="ruby18 ruby19"

inherit ruby-fakegem

DESCRIPTION="A pkg-config implementation by Ruby"
KEYWORDS="alpha amd64 ia64 ppc ~ppc64 sparc x86"
SRC_URI="mirror://rubygems/pkg-config-${PV}.gem"

IUSE=""
SLOT="0"

RDEPEND="${RDEPEND}"
DEPEND="${DEPEND}"

ruby_add_bdepend ">=dev-ruby/hoe-2.4.0"
