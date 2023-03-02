# Gentoo Studio

EAPI=8

DESCRIPTION="Package/system update script for Gentoo Studio"
HOMEPAGE="https://gentoostudio.org"
SRC_URI="https://gentoostudio.org/src/pkgs/$P.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	exeinto /usr/bin
	doexe pkgupdate.sh
}
