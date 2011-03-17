# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2
USE_RUBY="ruby19"

inherit ruby-fakegem

DESCRIPTION="A simple library to read mbox files."
HOMEPAGE="http://github.com/meh/ruby-mbox"

SLOT="0"
KEYWORDS="~amd64 ~x86"

ruby_add_rdepend "dev-ruby/json"
