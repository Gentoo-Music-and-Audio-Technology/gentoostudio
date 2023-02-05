# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{9,10,11} )
PYTHON_REQ_USE='threads(+)'
inherit git-r3 python-any-r1 waf-utils

DESCRIPTION=" GTK+ application that shows MIDI events"
HOMEPAGE="https://github.com/nedko/gmidimonitor"
EGIT_REPO_URI="https://github.com/nedko/gmidimonitor"
EGIT_BRANCH="main"
KEYWORDS=""
EGIT_SUBMODULES=()

LICENSE="GPL-2"
SLOT="0"

IUSE="alsa jack lash"
REQUIRED_USE="|| ( alsa jack )"

RDEPEND="x11-libs/gtk+:2
	alsa? ( media-libs/alsa-lib )
	jack? ( virtual/jack )
	lash? ( media-sound/ladish[lash] )"
DEPEND="${RDEPEND}
	${PYTHON_DEPS}
	virtual/pkgconfig"

DOCS=( AUTHORS README NEWS )

src_configure() {
	local -a mywafconfargs=(
		--alsa $(usex alsa)
		--jack $(usex jack)
		--lash $(usex lash)
	)
	waf-utils_src_configure "${mywafconfargs[@]}"
}
