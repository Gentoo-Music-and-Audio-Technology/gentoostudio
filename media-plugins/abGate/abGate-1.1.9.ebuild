# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="LV2 noise gate"
HOMEPAGE="https://abgate.sourceforge.io/"
SRC_URI="https://github.com/antanasbruzas/abGate/archive/v1.1.9.tar.gz"
KEYWORDS="amd64"
LICENSE="GPLv3"
SLOT="0"
RESTRICT="mirror"

IUSE=""

# qt-creator contains qmake
DEPEND="dev-ruby/pkg-config
	dev-cpp/gtkmm
	dev-qt/qt-creator
	media-libs/lv2
"
RDEPEND="${DEPEND}"

src_configure() {
	make
}

src_install() {
	make install
}
