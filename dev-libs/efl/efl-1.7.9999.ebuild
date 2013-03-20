# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/x11-wm/enlightenment/enlightenment-0.16.9999.ebuild,v 1.40 2012/11/08 07:56:38 vapier Exp $

EAPI="4"
if [[ ${PV} == *9999 ]] ; then
	EGIT_REPO_URI="http://git.enlightenment.org/core/${PN}.git"
	inherit git-2 autotools
	EGIT_BRANCH="master"
	SRC_URI=""
	KEYWORDS="x86"
fi
inherit eutils

DESCRIPTION="EFL Core Libraries"
HOMEPAGE="http://www.enlightenment.org/"

LICENSE="BSD"
SLOT="0"
IUSE="crypto tests dbus-services systemd valgrind +X wayland opengl fb sdl
cocoa fontconfig bidi harfbuzz egl pixman +gif +jpeg +png svg tiff webp glib gstreamer
pulseaudio gesture physics multisense xinerama v4l2 xprint xscreensaver"

RDEPEND="physics? ( >=sci-physics/bullet-2.80 )
	sdl? ( media-libs/libsdl )
	gif? ( media-libs/giflib )
	jpeg? ( virtual/jpeg )
	png? ( media-libs/libpng  )
	bidi? ( >=dev-libs/fribidi-0.19.1 )
	X? (
		x11-libs/libx11
		x11-libs/libXcomposite
		x11-libs/libXcursor
		x11-libs/libXdamage
		x11-libs/libXext
		x11-libs/libXfixes
		x11-libs/libXi
		x11-libs/libXrender
		x11-libs/libXtst
		xinerama? ( x11-libs/libXinerama x11-libs/libXrandr )
		xprint? ( x11-libs/libXp )
		xscreensaver? ( x11-libs/libXScrnSaver )
	)
"
DEPEND="${RDEPEND}"

src_prepare() {
	if [[ ! -e configure ]] ; then
		eautopoint
		eautoreconf
	fi
}

src_configure(){
	MY_ECONF="
	"
}

src_install() {
	default
}
