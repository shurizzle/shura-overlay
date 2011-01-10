# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2
USE_RUBY="ruby19"

inherit ruby-fakegem

DESCRIPTION="Various middleware for Faraday"
HOMEPAGE="http://wynnnetherland.com/projects/faraday-middleware/"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"

ruby_add_rdepend ">=dev-ruby/faraday-0.5.3"
