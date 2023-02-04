# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="FM Plugin Synth"
HOMEPAGE="https://github.com/asb2m10/dexed"
SRC_URI="https://github.com/asb2m10/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
    media-libs/alsa-lib
    net-misc/curl:=[curl_ssl_openssl]
    >=media-libs/freeglut-3.0.0
    media-libs/freetype
    x11-libs/libX11
    x11-libs/libXcomposite
    x11-libs/libXcursor
    x11-libs/libXinerama
    x11-libs/libXrandr
    media-libs/mesa
"
RDEPEND="${DEPEND}"

S="${S}/Builds/Linux"

src_install() {
    dolib.so build/Dexed.so
    dobin build/Dexed
}
