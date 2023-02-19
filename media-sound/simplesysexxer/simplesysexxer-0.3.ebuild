# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=7

inherit eutils

MY_P="SimpleSysexxer"

DESCRIPTION="a small tool to load, send, receive, save and request sysex data on
MIDI devices"
HOMEPAGE="http://sourceforge.net/projects/sysexxer/"
SRC_URI="mirror://sourceforge/sysexxer/${MY_P}-${PV}.tar.gz"

LICENSE="GPL-2 HPND"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

S="${WORKDIR}/${MY_P}-${PV}"

DEPEND=">=media-libs/alsa-lib-1.0.9
	dev-qt/qtcore
	dev-qt/qtgui"
RDEPEND="${DEPEND}"

src_configure() {
	# remove the -O0 -g3 CXXFLAGS
	sed -i -e "s/QMAKE_CXXFLAGS/#QMAKE_CXXFLAGS/" \
		SimpleSysexxer.pro || die "sed of SimpleSysexxer.pro failed"

	qmake5 SimpleSysexxer.pro
}

src_install() {
	dobin bin/simplesysexxer
	doicon bin/simplesysexxer.png
	make_desktop_entry simplesysexxer SimpleSysexxer simplesysexxer \
		"AudioVideo;Audio;Midi;"
	dodoc CHANGELOG COPYRIGHT CREDITS
}
