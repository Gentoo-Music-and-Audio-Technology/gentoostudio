EAPI=8

DESCRIPTION="BUTT (Broadcast Using This Tool) is an easy to use, multi OS streaming tool."
HOMEPAGE="https://danielnoethen.de/butt/"
SRC_URI="https://sourceforge.net/projects/butt/files/butt/$P/$P.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

inherit flag-o-matic

# These deps are taken from upstream's stated requirements:
# fltk-1.3, portaudio19, libmp3lame, libvorbis, libogg, libflac, libopus, libsamplerate, libfdk-aac, libdbus-1, libssl
DEPEND="media-libs/fdk-aac
	x11-libs/fltk
	media-libs/portaudio
	media-sound/lame
	media-libs/libvorbis
	media-libs/libogg
	media-libs/flac
	media-libs/opus
	media-libs/libsamplerate
	sys-apps/dbus
	dev-libs/openssl"
RDEPEND="${DEPEND}"
BDEPEND=""

src_configure() {
	append-ldflags "$(fltk-config --ldflags)"
	eautoreconf -i
}

src_install() {
	emake DESTDIR="${D}" install
}
