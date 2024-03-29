# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3

DESCRIPTION="This program is a JACK client that sends MIDI beat clock pulses based on the current tempo given by the JACK transport."
HOMEPAGE="https://github.com/x42/jack_midi_clock"
EGIT_REPO_URI="https://github.com/x42/jack_midi_clock.git"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE=""

RDEPEND="virtual/jack"
DEPEND="${RDEPEND}"

src_install() {
	dodir /usr/$(get_libdir)/jack
	default
}
