# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2
USE_RUBY="ruby18 ruby19 jruby"

inherit ruby-fakegem

DESCRIPTION="DataMapper - Core"
HOMEPAGE="http://datamapper.org/"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~x86"
IUSE="dev"

ruby_add_rdepend ">=dev-ruby/addressable-2.2
	>=extlib-0.9.15
	dev? ( >=dev-ruby/jeweler-1.4
		   >=dev-ruby/rspec-1.3 )"
