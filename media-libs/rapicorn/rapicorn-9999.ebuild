# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
PYTHON_COMPAT=( python2_7 )
inherit git-r3 python-any-r1

DESCRIPTION="Graphical UI toolkit for rapid development of user interfaces in C++ and Python"
HOMEPAGE="https://github.com/tim-janik/rapicorn"
EGIT_REPO_URI="https://github.com/tim-janik/rapicorn.git"

LICENSE=""
SLOT="0"
KEYWORDS=""
IUSE=""

RDEPEND=""
DEPEND="${RDEPEND}"

# Not sure this pkg has any rdeps at all.
#RDEPEND="gnome-base/librsvg
#	dev-util/intltool
#	x11-libs/pango
#	dev-libs/libxml2
#	sys-libs/readline"
#DEPEND="${RDEPEND}
#	=dev-lang/python-2*
#	dev-python/enum34
#	dev-python/xvfbwrapper
#	dev-python/cython
#	app-doc/doxygen
#	app-text/pandoc-bin
#	media-gfx/graphviz
#	app-text/texlive"

src_configure() {
	econf
}

src_compile() {
	emake -j`nproc`
	emake -j`nproc` check
	emake install
	emake -j`nproc` installcheck
}
