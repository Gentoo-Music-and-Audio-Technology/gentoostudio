# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# net-libs/nodejs satisfies dep for npm.
# media-libs/libmad is optional, but I'm putting it under RDEP for now.

EAPI=6

inherit autotools

DESCRIPTION="Digital synthesizer and music creation system"
HOMEPAGE="https://beast.testbit.org/"
SRC_URI="https://beast.testbit.org/pub/${P}.tar.xz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="media-libs/rapicorn
	gnome-base/libgnomecanvas
	media-libs/libogg
	media-libs/flac
	net-libs/nodejs
	media-libs/libmad"
DEPEND="${RDEPEND}"
