# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2
USE_RUBY="ruby18 ruby19 ree18 jruby"

inherit ruby-fakegem

DESCRIPTION="A Ruby text editor."
HOMEPAGE="http://redcareditor.com/"
#SRC_URI="mirror://rubygems/${P}.gem"

SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

ruby_add_rdepend "dev-ruby/ruby-rubyzip"

ruby_add_bdepend "dev-ruby/ruby-watchr
	dev-ruby/rspec
	dev-util/cucumber"
