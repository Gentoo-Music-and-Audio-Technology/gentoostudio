# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="Software musical instrument and audio synthesizer"
HOMEPAGE="https://dinisnoise.org"
SRC_URI=""https://archive.org/download/dinisnoise_source_code/${P}.tar.gz

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

# Not sure if libsdl or libsdl2 is needed here.
RDEPEND="virtual/opengl
	media-libs/libsdl2
	virtual/jack
	media-libs/alsa-lib"
DEPEND="${RDEPEND}
	dev-lang/tcl
	dev-libs/boost"
