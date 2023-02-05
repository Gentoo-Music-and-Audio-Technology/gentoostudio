# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit flag-o-matic toolchain-funcs

DESCRIPTION="gAlan - Graphical Audio Language"
HOMEPAGE="http://galan.sourceforge.net/"
#SRC_URI="https://gentoostudio.org/src/${P}.tar.gz"
SRC_URI="mirror://sourceforge/galan/${P}.tar.gz" # SF hosting not supported by GS ebuilds

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~x86"
IUSE="vorbis alsa opengl jack"

RDEPEND="x11-libs/gtk+:2
	vorbis? ( >=media-sound/vorbis-tools-1.0 )
	alsa? ( >=media-libs/alsa-lib-0.9.0_rc1 )
	opengl? (
		virtual/opengl
		virtual/glu
	)
	jack? ( virtual/jack )
	media-libs/liblrdf
	media-libs/ladspa-sdk
	media-libs/audiofile
	media-libs/libsndfile
	sci-libs/fftw"
DEPEND="${RDEPEND}
	virtual/pkgconfig"

DOCS=( AUTHORS NEWS NOTES README TODO )

src_configure() {
	# Use lrdf.pc to get -I/usr/include/raptor2 (lrdf.h -> raptor.h)
	append-cppflags $($(tc-getPKG_CONFIG) --cflags lrdf)
	econf --disable-static
}

src_install() {
	default
	find "${D}" -name '*.la' -exec rm -f {} +
}
