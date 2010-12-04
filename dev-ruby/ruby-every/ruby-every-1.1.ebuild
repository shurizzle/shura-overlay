# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2
USE_RUBY="ruby18 ruby19 ree18 jruby"

inherit ruby-fakegem

DESCRIPTION="Symbol#to_proc's hot cousin. Simple and elegant alternative to using &:method with enumerables."
HOMEPAGE="http://github.com/mynyml/every"
SRC_URI="mirror://rubygems/${P##ruby-}.gem"

SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

ruby_add_bdepend "dev-ruby/minitest"
