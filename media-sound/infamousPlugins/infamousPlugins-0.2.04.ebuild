# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# Dependencies require GentooStudio overlay + audio-overlay

EAPI=6

inherit cmake-utils

DESCRIPTION="A collection of open-source LV2 plugins"
HOMEPAGE="http://ssj71.github.io/infamousPlugins/index.html"
SRC_URI="https://github.com/ssj71/infamousPlugins/archive/v${PV}.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

# Dependencies call for "ntk-fluid." Not sure what this is.

RDEPEND="x11-libs/ntk
	x11-libs/cairo
	media-libs/lv2
	media-libs/zita-resampler
	sci-libs/fftw:3.0"
DEPEND="${RDEPEND}
	dev-util/cmake"

CMAKE_USE_DIR="${WORKDIR}/${P}/src"

#src_prepare(){
#       cmake-utils_src_prepare
#}

src_configure(){
	cmake-utils_src_configure
}

src_compile(){
        cmake-utils_src_compile
}

src_install(){
	cmake-utils_src_install
}
