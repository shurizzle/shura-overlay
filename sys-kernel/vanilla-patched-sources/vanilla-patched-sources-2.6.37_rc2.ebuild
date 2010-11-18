# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/sys-kernel/vanilla-sources/vanilla-sources-2.6.37_rc2.ebuild,v 1.1 2010/11/16 19:20:17 spatz Exp $

K_NOUSENAME="yes"
K_NOSETEXTRAVERSION="yes"
K_SECURITY_UNSUPPORTED="1"
ETYPE="sources"
inherit kernel-2
detect_version

DESCRIPTION="Full sources for the Linux kernel"
HOMEPAGE="http://www.kernel.org"
SRC_URI="${KERNEL_URI}"

KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~ppc ~ppc64 ~sh ~sparc ~x86"
IUSE=""
PROVIDE="sys-kernel/vanilla-sources"

src_unpack() {
	kernel-2_src_unpack
	epatch "${FILESDIR}/tty_scheduler.patch"
}

pkg_postinst() {
	kernel-2_pkg_postinst
	einfo "This patch implements an idea from Linus, to automatically create task groups
per tty, to improve desktop interactivity under hefty load such as kbuild.  The
feature is enabled from boot by default,  The default setting can be changed via
the boot option ttysched=0, and can be can be turned on or off on the fly via
echo [01] > /proc/sys/kernel/sched_tty_sched_enabled."
	einfo "http://lkml.org/lkml/2010/10/19/123"
}
