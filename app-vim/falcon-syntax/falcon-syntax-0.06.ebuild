# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-vim/pam-syntax/pam-syntax-20060424.ebuild,v 1.11 2010/10/07 03:28:02 leio Exp $

inherit vim-plugin

DESCRIPTION="vim plugin: falcon programmin language syntax highlighting"
HOMEPAGE="http://www.vim.org/scripts/script.php?script_id=2745"
SRC_URI="http://falconpl.org/project_dl/highlights/Falcon_vim.zip"

LICENSE="as-is"
KEYWORDS="alpha amd64 arm hppa ia64 m68k ~mips ppc ppc64 s390 sh sparc x86 ~sparc-fbsd ~x86-fbsd"
IUSE=""

VIM_PLUGIN_HELPTEXT=\
"This plugin provides syntax highlighting for falcon programming language"

src_unpack() {
	mkdir -p "${S}"
	cd "${S}"
	unpack "${A}"
	rm - Rf __MACOSX
}
