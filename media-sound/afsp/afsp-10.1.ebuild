# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit eutils versionator

MY_PN="AFsp"
MY_PV="v$(replace_version_separator "1" "r")"
MY_P="${MY_PN}-${MY_PV}a"

DESCRIPTION="Audio file utility programs"
HOMEPAGE="http://www-mmsp.ece.mcgill.ca/Documents/Downloads/AFsp/index.html"
SRC_URI="http://www-mmsp.ece.mcgill.ca/Documents/Downloads/AFsp/${MY_P}.tar.gz"
LICENSE="AFsp"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

RDEPEND=""
DEPEND="${RDEPEND}"

S="${WORKDIR}/${MY_P}"

PATCHES=( "${FILESDIR}/${PN}-makefile.patch" )

src_compile() {
          # Yes, the -j1 is necessary, compile fails otherwise.
        emake -j1
}

src_install() {
        rm -r "${S}"/bin/{Cygwin,Linux,Windows} || die
        emake DESTDIR=${D} install
        dodoc Notes.txt README.txt
}
