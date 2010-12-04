# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2
USE_RUBY="ruby18 ruby19"

inherit ruby-fakegem

#DESCRIPTION=""
HOMEPAGE="http://github.com/shurizzle/arbi"
#SRC_URI=""

SLOT="0"
KEYWORDS="~amd64 ~x86"

ruby_add_rdepend "dev-ruby/sys-filesystem"

all_ruby_install() {
	all_fakegem_install

	newinitd "${FILESDIR}/initd" "${PN}"
}
