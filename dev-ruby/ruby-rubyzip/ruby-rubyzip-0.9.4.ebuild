# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2
USE_RUBY="ruby18 ruby19 ree18 jruby"

inherit ruby-fakegem

DESCRIPTION="A ruby module for reading and writing zip files"
HOMEPAGE="http://rubyzip.sourceforge.net/"
SRC_URI="mirror://rubygems/${P##ruby-}.gem"

SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
