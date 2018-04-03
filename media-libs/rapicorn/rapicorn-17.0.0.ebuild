# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Required for media-sound/beast-0.11.0. Future versions of beast will not depend on Rapicorn.
# Guessing at dev-python/xvfbwrapper instead of x11-misc/xvfb-run.
# Guessing at dev-python/graphviz, which pulls in media-gfx/graphviz anyway.
# Not familiar with texlive, guessing at RDEP instead of DEP. Ditto pandoc.

EAPI=6

PYTHON_COMPAT=( python2_7 )

inherit autotools eutils python-single-r1

DESCRIPTION="GUI toolkit offering concise declarative UI design notation"
HOMEPAGE="https://testbit.eu/wiki/Rapicorn_Org"
SRC_URI="https://testbit.eu/pub/dists/rapicorn/${P}.tar.xz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="gnome-base/librsvg
	x11-libs/pango
	dev-libs/libxml2
	sys-libs/readline:0
	dev-lang/python:2.7
	dev-python/enum34
	dev-python/xvfbwrapper
	dev-python/graphviz
	app-text/texlive
	app-text/pandoc
	media-libs/libpng:0"
DEPEND="${RDEPEND}
	dev-util/intltool
	dev-python/cython
	app-doc/doxygen"

PATCHES=( "${FILESDIR}/${P}-sinfex-ansi.patch" )

#src_prepare(){
#	eapply -p0 "${FILESDIR}/${P}"-sinfex-ansi.patch
#	eapply_user
#}
