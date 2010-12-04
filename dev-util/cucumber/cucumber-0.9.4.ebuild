# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-util/cucumber/cucumber-0.7.3-r1.ebuild,v 1.4 2010/10/31 08:22:46 graaff Exp $

EAPI=2
USE_RUBY="ruby18 ruby19 ree18"

# Documentation task depends on sdoc which we currently don't have.
RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_TASK_TEST="spec cucumber"
RUBY_FAKEGEM_EXTRADOC="History.txt README.rdoc"

inherit ruby-fakegem

DESCRIPTION="Executable feature scenarios"
HOMEPAGE="http://github.com/aslakhellesoy/cucumber/wikis"
LICENSE="Ruby"

KEYWORDS="~amd64 ~hppa ~ia64 ~ppc ~ppc64 ~sparc ~x86"
SLOT="0"
IUSE="examples"

PDEPEND=">=dev-ruby/gherkin-2.2.9"

ruby_add_bdepend ">=dev-ruby/spork-0.8.4
	>=dev-ruby/syntax-1.0.0
	>=dev-ruby/prawn-layout-0.8.4
	>=dev-ruby/prawn-0.8.4
	>=dev-ruby/rake-0.8.7
	test? ( >=dev-ruby/rspec-2.0.1
		>=dev-ruby/nokogiri-1.4.3 )"

ruby_add_rdepend "
	>=dev-ruby/builder-2.1.2
	>=dev-ruby/diff-lcs-1.1.2
	>=dev-ruby/json-1.4.6
	>=dev-ruby/term-ansicolor-1.0.5
"

all_ruby_prepare() {
	rm -f features/drb_server_integration.feature features/cucumber_cli.feature || die "Unable to remove unsupported features."
}

each_ruby_install() {
	each_fakegem_install

#	ruby_fakegem_doins VERSION.yml
}

all_ruby_install() {
	all_fakegem_install

	if use examples; then
		cp -pPR examples "${D}/usr/share/doc/${PF}" || die "Failed installing example files."
	fi
}

pkg_postinst() {
	ewarn "Cucumber 0.7.x has minor parsing incompatibilities. Check the upgrade guide"
	ewarn "for details: http://wiki.github.com/aslakhellesoy/cucumber/upgrading"
}
