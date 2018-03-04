# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake-utils

DESCRIPTION="A powerful and flexible parametric equalizer and more"
HOMEPAGE="http://eq10q.sourceforge.net"
# Not using SourceForge as SRC_URI due to SF being broken
SRC_URI="https://gentoostudio.org/src/${P}.tar.gz"

LICENSE="GPL"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="dev-cpp/gtkmm:2.4
	media-libs/lv2
	sci-libs/fftw:3.0"
DEPEND="${RDEPEND}
	dev-util/cmake"

src_configure() {
        local mycmakeargs=(
                -DCMAKE_INSTALL_PREFIX=/usr/$(get_libdir)/lv2
        )
        cmake-utils_src_configure
}

src_compile() {
        cmake-utils_src_make
        cmake-utils_src_compile
}

src_install() {
	cmake-utils_src_install
	#insinto /usr/$(get_libdir)/lv2
	#doins "${FILESDIR}"/sapistaEQv2.lv2/
	#insinto /usr/share/doc
	#doins "${FILESDIR}"/share/doc/"${P}"
}
