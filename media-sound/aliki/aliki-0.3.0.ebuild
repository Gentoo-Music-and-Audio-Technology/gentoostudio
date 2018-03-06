# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
inherit toolchain-funcs

DESCRIPTION="An integrated system for Impulse Response measurements"
HOMEPAGE="http://kokkinizita.linuxaudio.org/linuxaudio/"
SRC_URI="http://kokkinizita.linuxaudio.org/linuxaudio/downloads/${P}.tar.bz2"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc"

RDEPEND="virtual/jack
	>=media-libs/libclthreads-2.4.0
	>=media-libs/libclxclient-3.6.1
	>=media-libs/libsndfile-1.0.18
	>=media-libs/zita-alsa-pcmi-0.2.0
	>=sci-libs/fftw-3.2.2:3.0"
DEPEND="${RDEPEND}"

RESTRICT="mirror"

DOCS=(AUTHORS README)

PATCHES=("${FILESDIR}/${P}-Makefile.patch")

src_compile() {
	emake -C source CXX="$(tc-getCXX)" PREFIX="${EPREFIX}/usr"
}

src_install() {
	use doc && DOCS+=("${S}/doc/aliki-manual.pdf")

	emake -C source DESTDIR="${D}" PREFIX="${EPREFIX}/usr" install
	einstalldocs
}
