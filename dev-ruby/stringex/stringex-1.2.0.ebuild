# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2
USE_RUBY="ruby18 ruby19 jruby"

inherit ruby-fakegem

DESCRIPTION="Some useful extensions to Ruby's String class."
HOMEPAGE="http://github.com/rsl/stringex"

LICENSE="MIT"
SLOT="0"
KEYWORDS="x86 ~x86 amd64 ~amd64"
IUSE=""

ruby_add_bdepend "test? ( dev-ruby/jeweler )"
