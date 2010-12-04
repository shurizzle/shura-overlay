# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-ruby/gherkin/gherkin-1.0.30-r1.ebuild,v 1.4 2010/10/25 01:32:57 jer Exp $

EAPI=2
USE_RUBY="ruby18 ruby19 ree18"

RUBY_FAKEGEM_TASK_DOC="-I lib rdoc"
RUBY_FAKEGEM_TASK_TEST=""

RUBY_FAKEGEM_DOCDIR="rdoc"
RUBY_FAKEGEM_EXTRADOC="History.txt README.rdoc"

inherit ruby-fakegem

DESCRIPTION="Fast Gherkin lexer and parser based on Ragel."
HOMEPAGE="http://wiki.github.com/aslakhellesoy/cucumber/gherkin"
LICENSE="MIT"

KEYWORDS="~amd64 ~hppa ~ia64 ~ppc ~ppc64 ~sparc ~x86"
SLOT="0"
IUSE=""

DEPEND="${DEPEND} dev-util/ragel"

ruby_add_bdepend "
	>=dev-ruby/rspec-2.0.1
	>=dev-ruby/rake-compiler-0.7.1
	>=dev-ruby/awesome_print-0.2.1
	>=dev-util/cucumber-0.7.0"

ruby_add_rdepend ">=dev-ruby/term-ansicolor-1.0.5
	>=dev-ruby/json-1.4.6"

each_ruby_prepare() {
	sed -i '/[bB]undler/d' Rakefile
	sed -i 's/,bundle//' tasks/compile.rake
	sed -i '/[bB]undler/d' features/support/env.rb
	sed -i '/[bB]undler/d' spec/spec_helper.rb

#	sed -i -e '/check_dependencies/d' tasks/rspec.rake tasks/cucumber.rake || die
}

each_ruby_compile() {
	${RUBY} -I lib -S rake compile || die
}

each_ruby_test() {
	${RUBY} -S rake spec || die "Specs failed"
	CUCUMBER_HOME="${HOME}" ${RUBY} -S rake cucumber || die "Cucumber features failed"
}
