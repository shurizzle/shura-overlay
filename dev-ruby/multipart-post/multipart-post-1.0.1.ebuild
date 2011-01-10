# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2
USE_RUBY="ruby19"

inherit ruby-fakegem

DESCRIPTION="Use with Net::HTTP to do multipart form posts. IO values that have #content_type, #original_filename, and #local_path will be posted as a binary file."
HOMEPAGE="http://github.com/nicksieger/multipart-post"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"

ruby_add_rdepend ">=dev-ruby/rubyforge-2.0.4"
