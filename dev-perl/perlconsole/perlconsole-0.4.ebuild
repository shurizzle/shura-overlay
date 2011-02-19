# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

MODULE_AUTHOR="SUKRIA"
inherit perl-module

DESCRIPTION="Light program that lets you evaluate Perl code interactively."

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

RDEPEND="dev-lang/perl dev-perl/Term-ReadLine-Gnu dev-perl/Module-Refresh
dev-perl/Lexical-Persistence perl-core/Getopt-Long dev-perl/B-Keywords"
DEPEND="${RDEPEND}"

#SRC_TEST="do"
