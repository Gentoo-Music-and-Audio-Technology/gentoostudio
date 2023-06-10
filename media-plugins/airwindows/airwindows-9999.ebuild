# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Airwindows is a collection of high-quality plugins by Chris Johnson."
HOMEPAGE="https://www.airwindows.com/"
SRC_URI="https://www.airwindows.com/wp-content/uploads/LinuxVSTs.zip"

LICENSE=""
SLOT="0"
KEYWORDS="amd64"
RESTRICT=""
IUSE=""

RDEPEND=""

DESTDIR="/usr/lib64/airwindows"

src_unpack() {
	unpack LinuxVSTs.zip
}

src_install() {
	exeinto "${DESTDIR}"
	# Not sure if wildcards work here. It is a LONG list of files.
	doexe *.so
}
