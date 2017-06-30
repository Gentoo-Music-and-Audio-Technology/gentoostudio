# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit git-r3

DESCRIPTION="Collection of DPF (Delphi Plugin Framework) based plugins."
HOMEPAGE="http://distrho.sourceforge.net"

EGIT_BRANCH="master"
EGIT_REPO_URI="https://github.com/DISTRHO/DPF-Plugins.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="media-libs/alsa-lib
        virtual/jack"
DEPEND="${RDEPEND}
        media-libs/freetype
        dev-util/premake:3"
