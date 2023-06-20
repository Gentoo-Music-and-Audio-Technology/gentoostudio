# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# Re-hosted from SourceForge, which is unreliable
# Binary install, just cp to /usr/lib64/lv2

EAPI=8

DESCRIPTION="Open-source plugins that include EQs, dynamics, reverb and more."
HOMEPAGE="http://lsp-plug.in/"
SRC_URI="https://sourceforge.net/projects/lsp-plugins/files/lsp-plugins/1.2.7/Linux-x86_64/lsp-plugins-lv2-1.2.7-Linux-x86_64.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="amd64"
IUSE=""

# Need to verify these deps if installing the precompiled version
RDEPEND="virtual/jack
	media-libs/libsndfile
	dev-libs/expat
	x11-libs/cairo"
DEPEND="${RDEPEND}"

S="${WORKDIR}"

src_unpack() {
	unpack lsp-plugins-lv2-1.2.7-Linux-x86_64.tar.gz
}

src_install(){
	exeinto /usr/lib64/lv2/lsp-plugins.lv2
	doexe *.so
	insinto /usr/lib64/lv2/lsp-plugins.lv2
	doins *.ttl
}
