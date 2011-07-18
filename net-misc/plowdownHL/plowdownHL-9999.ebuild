# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit git

DESCRIPTION="high level script for plowshare "
HOMEPAGE="https://github.com/deolivec/plowdownHL/"
EGIT_REPO_URI="git://github.com/deolivec/plowdownHL.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="net-misc/plowshare"
RDEPEND="${DEPEND}"

src_prepare() {
	sed -i -e 's:/usr/local:/usr:g' src/* scripts/* || die "sed failed"
}

src_install() {
	insopts -m0755

	insinto /etc/plowdownHL
	doins plowdownHLrc

	insinto /etc/cron.hourly
	cat <<'EOF' > scripts/plowdownHL.cron
#!/bin/bash

cat /etc/passwd | sed -r 's/^([^:]+):.*$/\1/g' |
while read user; do
	groups "${user}" | grep -P '\Wplowdownhl\W' &&
		su "${user}" -c '/usr/share/plowdownHL/cron.sh'
done
EOF
	doins scripts/plowdownHL.cron

	insinto /usr/share/plowdownHL
	doins src/*

	insopts -m0644

	dobin scripts/pd[gi]
	dosym /usr/share/plowdownHL/rate.sh /usr/bin/pdr
	dosym /usr/share/plowdownHL/clean.sh /usr/bin/pdc
}

pkg_postinst() {
	enewgroup plowdownhl

	einfo "add your user to group plowdownhl to use it."
}
