# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2
USE_RUBY="ruby18 ruby19"

inherit ruby-fakegem

#DESCRIPTION=""
HOMEPAGE="http://github.com/shurizzle/arbi"

SLOT="0"
KEYWORDS="~amd64 ~x86"

ruby_add_rdepend "dev-ruby/sys-filesystem dev-ruby/json dev-ruby/eventmachine"

all_ruby_install() {
	all_fakegem_install

	newinitd "${FILESDIR}/initd" "${PN}"
	insinto  "/etc"
	doins    "${FILESDIR}/arbi.yaml"
}
