# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit git-r3 autotools

DESCRIPTION="Configurable interface for capturing audio loops in real-time"
HOMEPAGE="https://github.com/free-wheeling/freewheeling"
EGIT_REPO_URI="https://github.com/free-wheeling/freewheeling.git"

LICENSE=""
SLOT="0"
KEYWORDS=""
IUSE=""

RDEPEND="virtual/jack
	net-libs/gnutls
	media-libs/freetype
	media-libs/sdl-gfx
	media-libs/sdl2-ttf
	media-libs/liblo
	dev-libs/libxml2
	media-libs/libvorbis
	media-libs/libsndfile
	media-sound/fluidsynth"
DEPEND="${RDEPEND}"

src_compile(){
	eautoreconf -ivf
	eautomake --add-mising
}
