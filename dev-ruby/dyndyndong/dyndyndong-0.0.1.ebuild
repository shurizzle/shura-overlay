# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2
USE_RUBY="ruby18 ruby19"

inherit ruby-fakegem

DESCRIPTION="Ruby written client to update dynamic dns, it supports many services."
HOMEPAGE="http://github.com/shurizzle/DynDynDong"

LICENSE="AGPL"
SLOT="0"
KEYWORDS="~x86"

ruby_add_bdepend "dev-ruby/daemons"

all_ruby_install() {
	all_fakegem_install

	ruby_fakegem_binwrapper ${PN} "${PN}-${PV}"
	newinitd "${FILESDIR}/initd" "${PN}"
	insinto /etc
	doins "${FILESDIR}/${PN}.conf"
}

pkg_postinst() {
	enewgroup dyndyndong
	enewuser dyndyndong -1 /bin/bash -1 dyndyndong
}
