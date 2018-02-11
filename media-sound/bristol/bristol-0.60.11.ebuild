# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit eutils autotools

DESCRIPTION="Synthesizer keyboard emulation package: Moog, Hammond and others"
HOMEPAGE="https://sourceforge.net/projects/bristol"
SRC_URI="mirror://sourceforge/bristol/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="alsa oss static-libs"
# osc : configure option but no code it seems...
# jack: fails to build if disabled
# pulseaudio: not fully supported

RDEPEND="virtual/jack
	alsa? ( >=media-libs/alsa-lib-1.0.0 )
	x11-libs/libX11"
# osc? ( >=media-libs/liblo-0.22 )
DEPEND="${RDEPEND}
	x11-proto/xproto
	virtual/pkgconfig"

DOCS=( AUTHORS ChangeLog HOWTO NEWS README )

src_prepare() {
	default
	epatch "${FILESDIR}"/${P}-cflags.patch
	epatch "${FILESDIR}"/${P}-implicit-dec.patch
	epatch "${FILESDIR}"/${P}-rm_alsa_iatomic.h.patch
	eautoreconf
}

src_configure() {
	econf \
		$(use_enable static-libs static) \
		--disable-version-check \
		$(use_enable oss) \
		$(use_enable alsa)
}

src_install() {
	default
	prune_libtool_files
	make_desktop_entry "startBristol -explorer -jack" "Bristol: explorer"
	make_desktop_entry "startBristol -mini -jack" "Bristol: mini"
	make_desktop_entry "startBristol -memory -jack" "Bristol: memory"
	make_desktop_entry "startBristol -hammond -jack" "Bristol: hammond"
	make_desktop_entry "startBristol -b3 -jack" "Bristol: b3"
	make_desktop_entry "startBristol -dx -jack" "Bristol: dx"
	make_desktop_entry "startBristol -axxe -jack" "Bristol: axxe"
	make_desktop_entry "startBristol -odyssey -jack" "Bristol: odyssey"
	make_desktop_entry "startBristol -2600 -jack" "Bristol: 2600"
	make_desktop_entry "startBristol -mono -jack" "Bristol: mono"
	make_desktop_entry "startBristol -poly -jack" "Bristol: poly"
	make_desktop_entry "startBristol -juno -jack" "Bristol: juno"
	make_desktop_entry "startBristol -prophet -jack" "Bristol: prophet"
	make_desktop_entry "startBristol -pro10 -jack" "Bristol: pro10"
	make_desktop_entry "startBristol -pro52 -jack" "Bristol: pro52"
	make_desktop_entry "startBristol -mixer -jack" "Bristol: mixer"
	make_desktop_entry "startBristol -vox -jack" "Bristol: vox"
	make_desktop_entry "startBristol -rhodes -jack" "Bristol: rhodes"
	make_desktop_entry "startBristol -rhodesbass -jack" "Bristol: rhodesbass"
	make_desktop_entry "startBristol -obx -jack" "Bristol: obx"
	make_desktop_entry "startBristol -obxa -jack" "Bristol: obxa"
	make_desktop_entry "startBristol -aks -jack" "Bristol: aks"
	#Todo: put them all in their own Bristol submenu and change to friendlier menu entry names.
}
