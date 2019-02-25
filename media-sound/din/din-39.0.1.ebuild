# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit autotools eutils

DESCRIPTION="Software musical instrument and audio synthesizer"
HOMEPAGE="https://dinisnoise.org"
SRC_URI="https://archive.org/download/dinisnoise_source_code/${P}.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="jack"

# Only builds with libsdl, not libsdl2.
# README has a condition for "if you want ALSA instead of JACK".
# The audio backend is selected at compile time only, not at runtime.

RDEPEND="!jack? ( media-libs/alsa-lib )
	media-libs/libsdl
	virtual/opengl
	jack? ( virtual/jack )"

DEPEND="${RDEPEND}
	dev-lang/tcl
	dev-libs/boost"

#PATCHES=( "${FILESDIR}/${P}-tcl-interp-sharedir.patch" )

src_prepare() {
#	epatch -p0 "${FILESDIR}"/tcl_interp_sharedir.patch
#	epatch_user
	default
	eautoreconf -fvi
}

src_configure(){
	# from README:
	#autoreconf -fvi
	#./configure CXXFLAGS="-O3 -D__UNIX_JACK__" CFLAGS=-O3
	econf CXXFLAGS="-O3 -D$(usex jack __UNIX_JACK__ __LINUX_ALSA__)" CFLAGS=-O3
}
