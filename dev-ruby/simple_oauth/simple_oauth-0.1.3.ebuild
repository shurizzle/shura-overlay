# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2
USE_RUBY="ruby19"

inherit ruby-fakegem

DESCRIPTION="Simply builds and verifies OAuth headers"
HOMEPAGE="http://rubydoc.info/gems/simple_oauth/0.1.3/frames"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"

ruby_add_rdepend "dev-ruby/mocha"
