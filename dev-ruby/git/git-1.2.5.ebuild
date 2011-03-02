# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-ruby/sinatra/sinatra-1.0.ebuild,v 1.6 2010/08/29 10:28:27 graaff Exp $

EAPI=2
USE_RUBY="ruby18 ruby19"

inherit ruby-fakegem

DESCRIPTION="Ruby library that can be used to create, read and manipulate Git
repositories by wrapping system calls to the git binary"
HOMEPAGE="http://github.com/schacon/ruby-git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
