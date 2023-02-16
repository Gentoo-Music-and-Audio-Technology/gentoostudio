# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{6,7,8,9,10,11} )
PYTHON_REQ_USE='threads(+)'

inherit flag-o-matic python-single-r1 waf-utils xdg-utils

DESCRIPTION="LADI Session Handler - a session management system for JACK applications"
HOMEPAGE="https://ladish.org"
inherit git-r3
EGIT_REPO_URI="https://github.com/LADI/ladish.git"
EGIT_BRANCH="main"
KEYWORDS="amd64 arm arm64 ~loong ppc ppc64 ~riscv x86"
EGIT_SUBMODULES=()

LICENSE="GPL-2"
SLOT="0"
RESTRICT="mirror"

IUSE="debug doc lash gtk"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

RDEPEND="media-libs/alsa-lib
	media-sound/jackdbus
	sys-apps/dbus
	dev-libs/expat
	lash? ( !media-sound/lash )
	gtk? (
		dev-libs/glib
		dev-libs/dbus-glib
		x11-libs/gtk+:2
		dev-cpp/gtkmm:2.4
		>=dev-cpp/libgnomecanvasmm-2.6.0
	)
	${PYTHON_DEPS}"
DEPEND="${RDEPEND}
	doc? ( app-doc/doxygen )
	>=media-sound/jack2-2.21.0
	virtual/pkgconfig"

DOCS=( AUTHORS README NEWS )

PATCHES=(
)

src_prepare()
{
	append-cxxflags '-std=c++11'
	default
}

src_configure() {
	local -a mywafconfargs=(
		--distnodeps
		$(usex debug --debug '')
		$(usex doc --doxygen '')
		$(usex gtk '--enable-gladish' '')
		$(usex lash '--enable-liblash' '')
	)
	waf-utils_src_configure "${mywafconfargs[@]}"
}

src_install() {
	use doc && HTML_DOCS="${S}/build/default/html/*"
	waf-utils_src_install
	python_fix_shebang "${ED}"
}

pkg_postinst() {
	xdg_icon_cache_update
}

pkg_postrm() {
	xdg_icon_cache_update
}
