# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit eutils versionator

MY_PN="AFsp"
MY_PV="v$(replace_version_separator "1" "r")"
MY_P="${MY_PN}-${MY_PV}a"

DESCRIPTION="audio file utility programs and library of routines for reading and writing audio files"
HOMEPAGE="http://www-mmsp.ece.mcgill.ca/Documents/Downloads/AFsp/index.html"
SRC_URI="http://www-mmsp.ece.mcgill.ca/Documents/Downloads/AFsp/${MY_P}.tar.gz"
LICENSE="AFsp"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

RDEPEND=""
DEPEND="${RDEPEND}"

S="${WORKDIR}/${MY_P}"

src_compile() {
	emake || die "emake failed"
}

src_install() {
	einstall prefix="${D}/usr" || die "emake install failed"
	dodoc Notes.txt README.txt
}
