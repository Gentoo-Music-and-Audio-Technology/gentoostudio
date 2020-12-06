# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Version 0.9.14 doesn't work with DISTDIR. This has been passed along to the Drumgizmo team and they are aware of it.

EAPI=6

DESCRIPTION="Open source cross-platform drum plugin & stand-alone application."
HOMEPAGE="http://drumgizmo.org"
SRC_URI="http://www.drumgizmo.org/releases/${P}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="virtual/jack
	media-libs/lv2
	x11-libs/libX11
	media-libs/libsndfile
	media-libs/zita-resampler
	dev-libs/expat
	media-libs/libsmf"
DEPEND="${RDEPEND}"

src_configure()
{
	econf --enable-lv2
}
