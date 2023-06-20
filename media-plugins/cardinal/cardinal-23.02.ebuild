# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Cardinal is a free and open-source virtual modular synthesizer plugin/wrapper for VCV Rack."
HOMEPAGE="https://github.com/DISTRHO/Cardinal"
SRC_URI="https://github.com/DISTRHO/Cardinal/releases/download/23.02/Cardinal-linux-x86_64-23.02.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64"
RESTRICT=""
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

#DESTDIR="/usr/lib64/lv2/cardinal"
S="${WORKDIR}"

src_unpack() {
	unpack Cardinal-linux-x86_64-23.02.tar.gz
}

src_install() {
	exeinto /usr/lib64/lv2/cardinal.lv2
	doexe *.so
	insinto /usr/lib64/cardinal.lv2
	doins *.ttl
	doins resources
}
