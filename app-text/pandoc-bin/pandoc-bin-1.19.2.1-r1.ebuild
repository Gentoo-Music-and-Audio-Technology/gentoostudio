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
	dobin "${S}/usr/bin/pandoc"
	insinto /usr/lib64
	doins -r "${S}/usr/lib64/ghc-8.0.2/"
#	dodir /usr/lib64/ghc-8.0.2/gentoo
#	insinto /usr/lib64/ghc-8.0.2/gentoo
#	doins "${S}/usr/lib64/ghc-8.0.2/gentoo/pandoc-1.19.2.1-r1.conf"
}
