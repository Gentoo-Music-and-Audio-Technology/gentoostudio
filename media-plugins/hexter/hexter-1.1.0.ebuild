# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit autotools git-r3

DESCRIPTION="Yamaha DX7 modeling DSSI plugin"
HOMEPAGE="http://dssi.sourceforge.net/hexter.html"
EGIT_REPO_URI="https://github.com/smbolton/hexter.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="gtk2 readline"

RDEPEND="media-libs/alsa-lib
	media-libs/dssi
	media-libs/liblo
	gtk2? ( x11-libs/gtk+:2 )
	readline? ( sys-libs/readline:0
		sys-libs/ncurses )"
DEPEND="${RDEPEND}
	media-libs/ladspa-sdk
	virtual/pkgconfig"

src_prepare(){
	default
	eautoconf
}

src_configure() {
	econf $(use_with gtk2) \
		$(use_with readline textui)
}

src_install() {
	emake DESTDIR="${D}" install
	dodoc AUTHORS ChangeLog README TODO
}
