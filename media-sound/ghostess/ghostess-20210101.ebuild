# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

#inherit eutils

RESTRICT="mirror"
DESCRIPTION="graphical DSSI host, based on jack-dssi-host"
HOMEPAGE="http://www.smbolton.com/linux.html"
SRC_URI="http://www.smbolton.com/linux/${P}.tar.bz2"

LICENSE="GPL-2"
KEYWORDS="amd64 x86"
SLOT="0"
IUSE="jack"

RDEPEND="media-libs/dssi
	media-libs/liblo
	media-libs/ladspa-sdk
	x11-libs/gtk+:2
	jack? ( virtual/jack )"
DEPEND="${RDEPEND}
	virtual/pkgconfig"

DOCS=( AUTHORS ChangeLog README )

src_configure() {
	local myeconfargs=( $(use_with jack jackmidi) )
	default
}
