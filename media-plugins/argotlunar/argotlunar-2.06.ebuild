# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Argotlunar is a tool for creating surreal transformations of audio streams. Specifically, it is a real-time delay-line granulator."
HOMEPAGE="http://mourednik.github.io/argotlunar/"
SRC_URI="https://www.dropbox.com/s/fwtg6jfkzakj7is/argotlunar-2.06-linux_64.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64"
RESTRICT=""
IUSE=""

RDEPEND=""

DESTDIR="/usr/lib64/vst/argotlunar"
S="${WORKDIR}/argotlunar-2.06-linux_64"

src_unpack() {
	unpack argotlunar-2.06-linux_64.tar.gz
}

src_install() {
	exeinto "${DESTDIR}"
	doexe *.so
}

# There is a PDF and a set of presets. Where to put those?
