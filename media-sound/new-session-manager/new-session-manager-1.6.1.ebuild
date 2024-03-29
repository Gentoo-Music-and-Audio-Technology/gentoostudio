# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit meson flag-o-matic xdg-utils

DESCRIPTION="A tool to assist music production by grouping standalone programs into sessions"
HOMEPAGE="https://github.com/linuxaudio/new-session-manager"
SRC_URI="https://github.com/linuxaudio/new-session-manager/archive/v${PV}.tar.gz -> ${P}.tar.gz"
RESTRICT="mirror"
KEYWORDS="~amd64"
LICENSE="GPL-3"
SLOT="0"
RESTRICT="mirror"

IUSE="gui jack"

RDEPEND="
	media-libs/liblo
	gui? ( x11-libs/fltk )
	jack? ( virtual/jack )"
DEPEND=${RDEPEND}

src_prepare() {
	sed -i -e "s|doc/new-session-manager|doc/${PF}|" meson.build || die "sed failed"

	default
}

src_configure() {
	if use gui; then
		append-cppflags -I"$(fltk-config --includedir)"
		append-ldflags -L"$(dirname $(fltk-config --libs))"
	fi

	local emesonargs=(
		$(meson_use gui nsm-legacy-gui)
		$(meson_use gui nsm-proxy)
		$(meson_use jack jackpatch)
	)
	meson_src_configure
}

pkg_postinst() {
	xdg_desktop_database_update
	xdg_icon_cache_update
}

pkg_postrm() {
	xdg_desktop_database_update
	xdg_icon_cache_update
}
