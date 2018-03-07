# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
PYTHON_COMPAT=( python{2_5,2_6,2_7} )
inherit distutils-r1 bash-completion-r1

DESCRIPTION="Tool for creating soundscapes -- continuous, infinitely varying streams of sound"
HOMEPAGE="http://boodler.org/"
RESTRICT="mirror"
SRC_URI="http://boodler.org/dl/Boodler-${PV}.tar.gz"
LICENSE="LGPL-2 GPL-2 public-domain"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="alsa bash-completion coreaudio doc intmath jack lame qt4 shout vorbis"
REQUIRED_USE="shout? ( vorbis )"

RDEPEND="alsa? ( >=media-libs/alsa-lib-1.0.17a )
	jack? ( >=media-libs/bio2jack-0.9 )
	lame? ( >=media-sound/lame-3.98.2-r1 )
	shout? ( >=media-libs/libshout-2.1 )
	vorbis? ( >=media-libs/libvorbis-1.2.1_rc1-r2 )"
DEPEND="${RDEPEND}
	qt4? ( >=dev-python/PyQt4-4.7.3[X] )"

S=${WORKDIR}/Boodler-${PV}

HTML_DOCS=( doc/ )

python_prepare_all() {
	# fix bash completion script for new file names without extension in 2.0.4
	cp "${FILESDIR}/boodler" "${T}"/boodler || die
	sed -i -e s/\.py//g "${T}"/boodler || die

	distutils-r1_python_prepare_all
}

python_prepare() {
	if use qt4 ; then
		# copy to tmp dir so it can be modified later
		cp "${FILESDIR}"/boodle-ui-qt.py \
			"${T}"/${EPYTHON}/boodle-ui-qt || die

		# fix up the command name which was changed in boodler-2.0.4
		sed -i -e "s/\"boodler.py\"/\"boodler\"/" \
			"${T}"/${EPYTHON}/boodle-ui-qt || die
	fi

	default
	#distutils-r1_python_prepare
}

python_configure_all() {
	local defdriver
	local with
	local without

	# set up a default audio driver (not daemon) according to USE flags.
	# it does not appear to work in setup.cfg so there is a workaround below.
	if use coreaudio ; then
		defdriver=macosx
	elif use alsa ; then
		defdriver=alsa
	else
		defdriver=oss
	fi

	# this ugly code enables/disables the output drivers
	# oss seems to be needed for boodler.py --list-drivers to work
	with="${with}oss,"
	use alsa && with="${with}alsa," || without="${without}alsa,"
	use coreaudio && with="${with}macosx,osxaq," \
		|| without="${without}macosx,osxaq,"
	without="${without}esd,"
	use jack && with="${with}jackb," || without="${without}jackb,"
	use lame && with="${with}lame," || without="${without}lame,"
	use shout && with="${with}shout," || without="${without}shout,"
	use vorbis && with="${with}vorbis," || without="${without}vorbis,"

	# move the original setup.cfg out of the way as a backup to check syntax
	mv setup.cfg setup.cfg.orig || die

	# fill the setup.cfg with the values
	cat > setup.cfg <<-EOF
		[build_scripts]
		default_driver=${defdriver}
		[build_ext]
		with-drivers=${with}
		without-drivers=${without}
		intmath=$(use intmath && echo 1 || echo 0)
	EOF

	mydistutilargs=( --default-driver ${defdriver} )
}

python_install() {
	# a pyqt4 gui addon for boodler downloaded from the official site
	# http://boodler.org/dl/etc/boodle-ui-qt.py
	if use qt4 ; then
		python_doscript "${T}"/${EPYTHON}/boodle-ui-qt
	fi

	distutils-r1_python_install
}

src_install() {
	distutils-r1_src_install

	# a bash completion addon script downloaded from the official site
	# http://boodler.org/dl/etc/bash_completion.d/boodler
	dobashcomp "${T}/boodler"
}
