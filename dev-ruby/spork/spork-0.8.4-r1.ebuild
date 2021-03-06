# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-ruby/spork/spork-0.8.4-r1.ebuild,v 1.2 2010/10/09 07:52:21 graaff Exp $

EAPI=2

USE_RUBY="ruby18 ruby19 ree18"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.rdoc"
RUBY_FAKEGEM_EXTRAINSTALL="assets"

inherit ruby-fakegem

DESCRIPTION="Spork is Tim Harper's implementation of test server."
HOMEPAGE="http://github.com/timcharper/spork"
LICENSE="MIT"

KEYWORDS="~amd64"
SLOT="0"
IUSE=""

each_ruby_prepare() {
	# Don't use deprecated name in feature file.
	sed -i -e 's/Fonction/Fonctionnalité/' features/cucumber_rails_integration.feature || die
}

each_ruby_test() {
	${RUBY} -S spec spec || die
	${RUBY} -Ilib -S cucumber features || die
}
