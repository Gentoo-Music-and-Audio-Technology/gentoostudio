# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION=""
HOMEPAGE=""
SRC_URI="https://x42-plugins.com/x42/linux/x42-meters-v0.9.25-x86_64.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64"
RESTRICT=""
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

DESTDIR="/usr/lib64/lv2/x42-meters.lv2"
S="${WORKDIR}/x42-meters/meters.lv2"

src_unpack() {
	unpack x42-meters-v0.9.25-x86_64.tar.gz
}

src_install() {
	exeinto "${DESTDIR}"
	doexe *.so
	insinto "${DESTDIR}"
	doins *.ttl
}
