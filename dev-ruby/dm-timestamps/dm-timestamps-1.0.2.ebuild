# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2
USE_RUBY="ruby18 ruby19 jruby"

inherit ruby-fakegem

DESCRIPTION="DataMapper plugin for magical timestamps"
HOMEPAGE="http://datamapper.org/"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~x86"
IUSE="dev"

ruby_add_rdepend "~dev-ruby/dm-core-${PV}
	dev? ( >=dev-ruby/rspec-1.3 )"
