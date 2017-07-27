# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $
# This ebuild works as-is.
# Upgrading to EAPI 6 requires the patch header to be -p1.
# I don't know how to do that yet.

EAPI=5
inherit base toolchain-funcs multilib

DESCRIPTION="C++ library for real-time resampling of audio signals"
HOMEPAGE="http://kokkinizita.linuxaudio.org/linuxaudio/"
SRC_URI="http://kokkinizita.linuxaudio.org/linuxaudio/downloads/${P}.tar.bz2"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 ~ppc x86"
IUSE=""

DEPEND="media-libs/libsndfile"
RDEPEND="${DEPEND}"

RESTRICT="mirror"

DOCS=(AUTHORS README)
HTML_DOCS=(docs/)

PATCHES=("${FILESDIR}"/${P}-Makefile.patch)

src_compile() {
	tc-export CXX
	emake -C libs
	emake -C apps
}

src_install() {
	emake -C libs DESTDIR="${D}" PREFIX="${EPREFIX}/usr" LIBDIR=$(get_libdir) install
	emake -C apps DESTDIR="${D}" PREFIX="${EPREFIX}/usr" install
	base_src_install_docs
}
