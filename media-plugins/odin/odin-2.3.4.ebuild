# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="24 voice polyphonic synthesizer with effects, classic and drawn waveforms, and classic filter emulations."
HOMEPAGE="https://thewavewarden.com/pages/odin-2"
SRC_URI="https://dl.dropboxusercontent.com/s/r7c2tu4dj6az75h/Odin2.3.4Linux.zip"

LICENSE=""
SLOT="0"
KEYWORDS="amd64"
RESTRICT=""
IUSE=""

RDEPEND=""

# LV2:
#DESTDIR="/usr/lib64/lv2/odin"
# VST3:
DESTDIR="/usr/lib/vst3"

# LV2:
#S="${WORKDIR}/Odin2.lv2"
# VST3:
# !needed

src_unpack() {
	unpack Odin2.3.4Linux.zip
}

src_install() {
	# LV2:
	#exeinto "${DESTDIR}"
	#doexe *.so
	#insinto "${DESTDIR}"
	#doins *.ttl

	# VST3:
	dodir Odin2.vst3
}
