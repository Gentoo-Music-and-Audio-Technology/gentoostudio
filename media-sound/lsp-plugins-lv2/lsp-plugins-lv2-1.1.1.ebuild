# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# Re-hosted from SourceForge, which is unreliable
# Binary install, just cp to /usr/lib64/lv2

EAPI=6

DESCRIPTION="Collection of open-source LADSPA, LV2 and LinuxVST plugins"
HOMEPAGE="http://lsp-plug.in/"
SRC_URI="https://gentoostudio.org/src/${P}-x86_64.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="virtual/jack
	media-libs/libsndfile
	dev-libs/expat
	x11-libs/cairo"
DEPEND="${RDEPEND}"

S="${WORKDIR}/${P}-x86_64"

src_install(){
	insinto /usr/lib64/lv2
	doins -r lsp-plugins.lv2
}
