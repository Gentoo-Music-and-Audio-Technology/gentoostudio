# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit autotools xdg git-r3

DESCRIPTION="A virtual MIDI keyboard for JACK MIDI"
HOMEPAGE="http://pin.if.uz.zgora.pl/~trasz/jack-keyboard/"
EGIT_REPO_URI="https://github.com/AlkorZ3/jack-keyboard.git"
EGIT_BRANCH="master"
EGIT_TAG="Jack-Keyboard-2.8.1"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="amd64 arm64 x86"
IUSE="lash X"

CDEPEND="
	dev-libs/glib:2
	virtual/jack
	x11-libs/gtk+:2
	lash? ( media-sound/lash )
	X? ( x11-libs/libX11 )
"
DEPEND="${CDEPEND}"
RDEPEND="${CDEPEND}"

#PATCHES=(
#	"${FILESDIR}/jack-keyboard-2.7.2-man.patch"
#)

WANT_LIBTOOL=non
src_prepare() {
	default
	eautoreconf
}

src_configure() {
#	local mycmakeargs=(
#		-DJackEnable=ON # though configurable, does not compile withou jack
#		-DLashEnable=$(usex lash)
#		-DX11Enable=$(usex X)
#	)

	local myeconfargs=(
#		$(use_enable lash )
#		$(use_enable X )
#		$(use_enable jack )
	)
	econf "${myeconfargs[@]}"
}
