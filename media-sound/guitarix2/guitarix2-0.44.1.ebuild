# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

#PYTHON_COMPAT=( python3_{8..9} )
PYTHON_COMPAT=( python{3_{9}} )
PYTHON_REQ_USE="threads(+)"
inherit python-any-r1 waf-utils

DESCRIPTION="A simple Linux Guitar Amplifier for jack with one input and two outputs"
HOMEPAGE="http://guitarix.sourceforge.net/"

RESTRICT="mirror"
# SourceForge hosting banned by Gentoo Studio
#SRC_URI="https://gentoostudio.org/src/${P}.tar.xz"
SRC_URI="mirror://sourceforge/guitarix/${P}.tar.gz"
S="${WORKDIR}/guitarix-${PV}"
KEYWORDS="~amd64 ~x86"

SLOT="0"
LICENSE="GPL-2"

IUSE="avahi +capture debug faust ladspa lv2 +meterbridge nls"

RDEPEND="dev-cpp/eigen:3
	dev-cpp/glibmm:2
	dev-cpp/gtkmm:2.4
	dev-libs/boost
	dev-libs/glib
	media-libs/liblrdf
	media-libs/libsndfile
	media-libs/lilv:0
	media-libs/zita-convolver
	media-libs/zita-resampler
	virtual/jack
	media-sound/lame
	sci-libs/fftw:3.0
	x11-libs/gtk+:2
	avahi? ( net-dns/avahi )
	faust? ( dev-lang/faust )
	ladspa? ( media-libs/ladspa-sdk )
	lv2? ( || ( media-libs/lv2core media-libs/lv2 ) )
	capture? ( media-sound/jack_capture )
        meterbridge? ( media-sound/meterbridge )"
DEPEND="${RDEPEND}
	virtual/pkgconfig
	nls? ( dev-util/intltool )"

DOCS=( changelog README )

src_unpack() {
	[[ "${PV}" = "9999" ]] && git-r3_src_unpack || default
}

src_configure() {
	local mywafconfargs=(
		--cxxflags-debug=""
		--cxxflags-release="-DNDEBUG"
		--nocache
		--shared-lib
		--lib-dev
		--no-ldconfig
		--no-desktop-update
		$(use_enable nls)
		$(usex avahi "" --no-avahi)
		$(usex debug --debug "")
		$(usex faust --faust --no-faust)
		$(usex ladspa --ladspadir="${EPREFIX}"/usr/share/ladspa "--no-ladspa --no-new-ladspa")
		$(usex lv2 --lv2dir="${EPREFIX}"/usr/$(get_libdir)/lv2 --no-lv2)
	)

	waf-utils_src_configure ${mywafconfargs[@]}
}
