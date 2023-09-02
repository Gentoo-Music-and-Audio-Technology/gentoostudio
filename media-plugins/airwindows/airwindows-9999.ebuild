# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Airwindows is a collection of high-quality plugins by Chris Johnson."
HOMEPAGE="https://www.airwindows.com/"
# It looks like the dev makes frequent updates and a versionless approach, so hosting it ourselves for stability.
#SRC_URI="https://www.airwindows.com/wp-content/uploads/LinuxVSTs.zip"
SRC_URI="https://decibellinux.org/src/pkgs/LinuxVSTs.zip"

LICENSE=""
SLOT="0"
KEYWORDS="amd64"
RESTRICT=""
IUSE=""

RDEPEND=""

DESTDIR="/usr/lib64/vst/airwindows"
S="${WORKDIR}/LinuxVSTs"

src_unpack() {
	unpack LinuxVSTs.zip
}

src_install() {
	exeinto "${DESTDIR}"
	doexe *.so
}
