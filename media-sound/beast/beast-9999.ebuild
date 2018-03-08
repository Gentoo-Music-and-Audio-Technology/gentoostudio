# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# Quickpkg'ing pandoc into a binary fails because dev-haskell/yaml is still needed
# So this is going to serve as the basic to build a binary for beast that GS users can install

EAPI=6
inherit git-r3 autotools

DESCRIPTION="BEAST - the Bedevilled Sound Engine"
HOMEPAGE="http://beast.gtk.org"
EGIT_REPO_URI="https://github.com/tim-janik/beast.git"

LICENSE="GPL-2 LGPL-2.1"
KEYWORDS="~amd64 ~x86"
SLOT="0"
IUSE=""

RDEPEND=""
DEPEND="${RDEPEND}
	app-text/pandoc
	app-doc/doxygen
	media-gfx/graphviz"

pkg_setup() {
	export PYTHON=/usr/bin/python2
}

src_prepare() {
	eautoreconf
	eapply_user
}
