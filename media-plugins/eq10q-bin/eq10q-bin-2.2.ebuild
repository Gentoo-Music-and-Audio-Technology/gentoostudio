# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit multilib unpacker

DESCRIPTION="LV2 audio plugin implementing a powerful and flexible parametric equalizer."
HOMEPAGE="http://eq10q.sourceforge.net"
SRC_URI="https://sourceforge.net/projects/eq10q/files/eq10q_2.2_installer.run"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"

S="${WORKDIR}"

src_install(){
        insinto /usr/$(get_libdir)/lv2
        doins -r "${S}"/gcc4_amd64/sapistaEQv2.lv2/
}
