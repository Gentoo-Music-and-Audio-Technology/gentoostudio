# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Audio file utility programs"
HOMEPAGE="https://www-mmsp.ece.mcgill.ca/Documents/Downloads/AFsp/index.html"
SRC_URI="https://gentoostudio.org/src/pkgs/${P}.tar.gz"
LICENSE="AFsp"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

RDEPEND=""
DEPEND="${RDEPEND}"

S="${WORKDIR}/AFsp-v10r4a"

src_compile() {
          # Yes, the -j1 is necessary, compile fails otherwise.
        emake -j1
}

src_install() {
        rm -r "${S}"/bin/{Cygwin,Linux} || die
        emake DESTDIR=${D} install
        dodoc Notes.txt README.txt
}
