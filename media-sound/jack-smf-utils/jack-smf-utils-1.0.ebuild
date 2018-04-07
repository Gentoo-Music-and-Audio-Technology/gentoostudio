# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="Utilities for MIDI streams and files using Jack MIDI"
HOMEPAGE="http://pin.if.uz.zgora.pl/~trasz/jack-smf-utils/"
# Homepage is either slow or down, hosting on Gentoo Studio
SRC_URI="https://gentoostudio.org/src/${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="lash readline"

RDEPEND="readline? ( sys-libs/readline )
	>=dev-libs/glib-2.2
	virtual/jack
	lash? ( media-sound/lash )"
DEPEND="${RDEPEND}
	virtual/pkgconfig"

src_compile() {
	econf $(use_with readline) \
		$(use_with lash)
	emake || die "make failed"
}

src_install() {
	emake DESTDIR="${D}" install || die "make install failed"
	dodoc AUTHORS TODO
}
