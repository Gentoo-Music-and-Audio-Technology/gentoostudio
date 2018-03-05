# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

inherit base eutils

MY_P="${P}-alsa+jack"

RESTRICT="mirror"
DESCRIPTION="reproduce sounds of strings, organs, flutes and drums in real time"
HOMEPAGE="http://www.linux-sound.org/${PN}"
SRC_URI="http://www.linux-sound.org/${PN}/${MY_P}.tgz"

IUSE="jack"

LICENSE="RTSynth"
SLOT="0"
KEYWORDS="~amd64  ~x86"

RDEPEND=">=x11-libs/fltk-1.1.2
	media-libs/libsndfile
	|| ( x11-libs/libXext virtual/x11 )
	media-libs/alsa-lib
	jack? ( virtual/jack )"
DEPEND=""

S="${WORKDIR}/${MY_P}"

DOCS=( "${S}/Changelog" "${S}/README" )
HTML_DOCS=( "${S}/HtmlDocs/" )

src_compile() {
	echo -n
}

src_install() {
	dodir /opt/bin

	insinto "/usr/share/doc/${P}/examples"
	for i in "${S}"/Examples-v192/*; do doins "${i}"; done

	# We are not attempting to compile the jack driver ourselves. The
	# build system (Makefile) is _very_ hardcoded and it would require
	# some of work to get it working.
	if use jack; then
		insinto /opt/rtsynth
		doins "${S}/libRTSjack.so"
		insinto /opt/bin
		doins "${S}/RTSynth-jack"
		fperms 755 /opt/bin/RTSynth-jack
		make_desktop_entry RTSynth-jack RTSynth-jack "${PN}" "AudioVideo;Audio"
	fi
	insinto /opt/bin
	doins "${S}/RTSynth"
	fperms 755 /opt/bin/RTSynth
	make_desktop_entry RTSynth RTSynth "${PN}" "AudioVideo;Audio"

	base_src_install_docs
}
