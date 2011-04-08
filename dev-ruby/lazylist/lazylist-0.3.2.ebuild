# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2
USE_RUBY="ruby18 ruby19"

inherit ruby-fakegem

DESCRIPTION="Implementation of lazy lists for Ruby"
HOMEPAGE="http://lazylist.rubyforge.org/"

LICENSE="|| ( Ruby GPL-2 )"
KEYWORDS="~x86 ~amd64"
SLOT="0"

ruby_add_rdepend "dev-ruby/dslkit"
