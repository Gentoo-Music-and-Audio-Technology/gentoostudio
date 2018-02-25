# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
inherit git-r3

DESCRIPTION="A polyphonic, touch-sensitive, realtime, phase-modulation (PM) software sound synthesizer"
HOMEPAGE="http://www.linuxsynths.com/6PMPatchesDemos/6pm.html"
EDIT_BRANCH="master"
EGIT_REPO_URI="https://github.com/michelvergnaud/6PM.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="virtual/jack"
DEPEND="${RDEPEND}"

src_install(){
	doexe install.sh
}
