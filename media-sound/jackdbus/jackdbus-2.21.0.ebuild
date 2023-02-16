# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{9..11} )
PYTHON_REQ_USE="threads(+)"
inherit flag-o-matic python-single-r1 waf-utils multilib-minimal
inherit git-r3

EGIT_REPO_URI="https://github.com/LADI/${PN}.git"
EGIT_BRANCH="stable"
EGIT_COMMIT="6e06864b630a9336d338ae4761487f951cf9e2e9"

KEYWORDS="amd64 arm arm64 ~loong ppc ppc64 ~riscv x86"

DESCRIPTION="D-Bus endpoint for JACK server"
HOMEPAGE="https://ladish.org/jackdbus.html"

LICENSE="GPL-2+ LGPL-2.1+"
SLOT="2"
IUSE=""
REQUIRED_USE="
	${PYTHON_REQUIRED_USE}"

DEPEND="
	sys-apps/dbus[${MULTILIB_USEDEP}]"
RDEPEND="
	${DEPEND}
	${PYTHON_DEPS}
	$(python_gen_cond_dep '
		dev-python/dbus-python[${PYTHON_USEDEP}]
	')
	!media-sound/jack-audio-connection-kit
	!media-video/pipewire[jack-sdk(-)]"
BDEPEND="
	${PYTHON_DEPS}
	virtual/pkgconfig"
PDEPEND=""

DOCS=( AUTHORS NEWS.rst README.adoc )

src_prepare() {
	default

	python_fix_shebang waf
	multilib_copy_sources
}

multilib_src_configure() {
	# clients crash if built with lto
	# https://github.com/jackaudio/jack2/issues/485
	filter-lto

	local wafargs=(
		--mandir="${EPREFIX}"/usr/share/man/man1 # override eclass' for man1
	)

	waf-utils_src_configure "${wafargs[@]}"
}

multilib_src_compile() {
	waf-utils_src_compile
}

multilib_src_install() {
	waf-utils_src_install
}

multilib_src_install_all() {
	python_fix_shebang "${ED}"/usr/bin/jack_control
}
