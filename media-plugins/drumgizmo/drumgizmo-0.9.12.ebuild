# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="Open source cross-platform drum plugin & stand-alone application."
HOMEPAGE="http://drumgizmo.org"
SRC_URI="http://www.drumgizmo.org/releases/${P}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="media-libs/lv2
        x11-libs/libX11
        media-libs/libsndfile
        media-libs/zita-resampler
        dev-libs/expat
        media-libs/libsmf"
RDEPEND="${DEPEND}"

src_configure()
{
        econf --enable-lv2
}
