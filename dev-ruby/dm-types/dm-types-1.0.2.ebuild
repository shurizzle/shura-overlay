# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2
USE_RUBY="ruby18 ruby19 jruby"

inherit ruby-fakegem

DESCRIPTION="DataMapper plugin providing extra data types"
HOMEPAGE="http://datamapper.org/"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="dev"

ruby_add_rdepend "~dev-ruby/dm-core-${PV}
	>=dev-ruby/json-1.4
	>=dev-ruby/fastercsv-1.5.3
	>=dev-ruby/uuidtools-2.1.1
	>=dev-ruby/stringex-1.1.0
	dev? ( >=dev-ruby/rspec-1.3
	       ~dev-ruby/dm-validations-${PV} )"
