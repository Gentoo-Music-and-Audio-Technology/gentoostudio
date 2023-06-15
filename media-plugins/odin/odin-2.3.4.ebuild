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

DESTDIR="/usr/lib64/lv2/odin"
S="${WORKDIR}/Odin2.lv2"

src_unpack() {
	unpack Odin2.3.4Linux.zip
}

src_install() {
	exeinto "${DESTDIR}"
	doexe *.so
	doins *.ttl
}
