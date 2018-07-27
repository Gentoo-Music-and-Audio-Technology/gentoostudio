# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
inherit git-r3

DESCRIPTION="Audio plugin host supporting many audio drivers and plugin formats"
HOMEPAGE="http://kxstudio.linuxaudio.org/"

EGIT_BRANCH="master"
EGIT_REPO_URI="https://github.com/falkTX/Carla.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"

IUSE="alsa jack +lv2ui +osc plugins pulseaudio +rdf samplers +X"

RDEPEND="dev-python/PyQt5
        alsa? ( media-libs/alsa-lib )
        jack? ( virtual/jack )
        lv2ui? ( x11-libs/gtk+:2 x11-libs/gtk+:3 dev-python/PyQt5 )
        osc? ( media-libs/liblo )
        plugins? ( sci-libs/fftw:3.0 dev-libs/mini-xml sys-libs/zlib x11-libs/ntk virtual/opengl media-libs/libprojectm-qt )
        pulseaudio? ( media-sound/pulseaudio )
        rdf? ( dev-python/rdflib )
        samplers? ( media-sound/fluidsynth media-sound/linuxsampler )
        X? ( x11-base/xorg-server )"
DEPEND="${RDEPEND}"
