# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="Cadence is a set of JACK tools useful for audio production."
HOMEPAGE="http://kxstudio.linuxaudio.org/Applications:Cadence"
SRC_URI="http://sourceforge.net/projects/kxstudio/files/Releases/cadence/Cadence-0.8.1-linux64.tar.xz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

S="${PORTAGE_BUILDDIR}/work/Cadence-0.8.1"

src_install() {
exeinto /usr/bin
doexe Cadence
doexe Cadence-JackMeter
doexe Cadence-JackSettings
doexe Cadence-Logs
doexe Cadence-Render
doexe Cadence-XYController
doexe Catarina
doexe Catia
doexe Claudia
}
