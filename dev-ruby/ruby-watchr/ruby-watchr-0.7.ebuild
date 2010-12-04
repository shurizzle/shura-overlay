# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2
USE_RUBY="ruby18 ruby19 ree18 jruby"

inherit ruby-fakegem

DESCRIPTION="Modern continious testing (flexible alternative to autotest)."
HOMEPAGE="http://mynyml.com/ruby/flexible-continuous-testing"
SRC_URI="mirror://rubygems/${P##ruby-}.gem"

SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

ruby_add_rdepend "dev-ruby/ruby-every
	dev-ruby/mocha
	dev-ruby/minitest"
