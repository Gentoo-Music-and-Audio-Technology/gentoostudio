# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="Binpkg for pandoc for use with media-sound/beast to bypass haskell dep hell"
HOMEPAGE="https://gentoostudio.org"
SRC_URI="https://gentoostudio.org/src/${P}.tbz2"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=""
DEPEND="${RDEPEND}"

S=${WORKDIR}

src_install() {
	insinto "/usr"
	newins "${D}/usr/bin/pandoc" "/usr/bin/pandoc"
}
