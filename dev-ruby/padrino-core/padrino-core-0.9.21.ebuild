# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-ruby/sinatra/sinatra-1.0.ebuild,v 1.6 2010/08/29 10:28:27 graaff Exp $

EAPI=2
USE_RUBY="ruby18 ruby19"

inherit ruby-fakegem

DESCRIPTION="The Padrino core gem required for use of this framework"
HOMEPAGE="http://www.padrinorb.com/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

ruby_add_rdepend 'dev-ruby/tzinfo
	>=dev-ruby/activesupport-3.0.0
	>=dev-ruby/thor-0.14.3
	>=dev-ruby/http_router-0.5.4
	>=dev-ruby/sinatra-1.1.0'
