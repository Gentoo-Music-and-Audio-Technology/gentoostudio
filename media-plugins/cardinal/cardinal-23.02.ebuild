# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Cardinal is a free and open-source virtual modular synthesizer plugin/wrapper for VCV Rack."
HOMEPAGE="https://github.com/DISTRHO/Cardinal"
SRC_URI="https://github.com/DISTRHO/Cardinal/releases/download/23.02/Cardinal-linux-x86_64-23.02.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64"
RESTRICT=""
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

S="${WORKDIR}"

src_unpack() {
	unpack Cardinal-linux-x86_64-23.02.tar.gz
}

src_install() {
	cd Cardinal.lv2
	exeinto /usr/lib64/lv2/cardinal.lv2
	doexe *.so
	insinto /usr/lib64/lv2/cardinal.lv2
	doins *.ttl
	doins -r resources
	cd ../CardinalFX.lv2
	exeinto /usr/lib64/lv2/cardinalfx.lv2
	doexe *.so
	insinto /usr/lib64/lv2/cardinalfx.lv2
	doins *.ttl
	doins -r resources
	cd ../CardinalMini.lv2
	exeinto /usr/lib64/lv2/cardinalmini.lv2
	doexe *.so
	insinto /usr/lib64/lv2/cardinalmini.lv2
	doins *.ttl
	doins -r resources
	doins -r modgui
	cd ../CardinalSynth.lv2
	exeinto /usr/lib64/lv2/cardinalsynth.lv2
	doexe *.so
	insinto /usr/lib64/lv2/cardinalsynth.lv2
	doins *.ttl
	doins -r resources
	cd ..
	exeinto /usr/bin
	doexe CardinalJack
	doexe CardinalNative
}
