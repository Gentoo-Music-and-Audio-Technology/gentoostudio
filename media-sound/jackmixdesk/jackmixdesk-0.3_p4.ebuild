# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

[[ "${PV}" = "9999" ]] && inherit subversion
inherit eutils

DESCRIPTION="Audio mixer for JACK with OSC control, LASH support and GTK GUI"
HOMEPAGE="http://sourceforge.net/projects/${PN}"

if [[ "${PV}" = 9999 ]]; then
	ESVN_REPO_URI="https://${PN}.svn.sourceforge.net/svnroot/${PN}/trunk"
	KEYWORDS=""
else
	MY_PV="${PV/_p/-r}"
	SRC_URI="https://gentoostudio.org/src/${PN}-${MY_PV}.tar.gz"
	S="${WORKDIR}/${PN}-${MY_PV}"
	KEYWORDS="~amd64 ~ppc ~x86"
fi

LICENSE="GPL-3"
SLOT="0"
IUSE=""

AUTOTOOLS_AUTORECONF="1"
DOCS=( AUTHORS ChangeLog README TODO )

# See if it works without virtual/liblash
RDEPEND="virtual/jack
	=x11-libs/gtk+-2*
	>=media-libs/liblo-0.25
	>=net-dns/libidn-1.13"
DEPEND="${RDEPEND}
	>=dev-libs/libxml2-2.6.28
	virtual/pkgconfig"

src_prepare() {
	default
}
src_configure() {
	default
}
src_install() {
	default
	doicon "doc/${PN}.svg"
	make_desktop_entry "${PN}_gtk" JackMixDesk "${PN}" "AudioVideo;Audio;Mixer"
}
