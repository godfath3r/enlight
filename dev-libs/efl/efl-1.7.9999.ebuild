# Copyright 1999-2012 Gentoo Foundation

# Distributed under the terms of the GNU General Public License v2
# $Header: 

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
IUSE="alsa crypto tests dbus-services systemd valgrind +X wayland opengl fb sdl
cocoa fontconfig +bidi harfbuzz egl pixman +gif +jpeg +png svg tiff webp glib +gstreamer
+pulseaudio gesture +physics multisense xinerama v4l2 +xprint +xscreensaver doc -debug"

RDEPEND="dev-libs/check
	dev-lang/lua
	dev-libs/dbus-glib
	media-libs/gst-plugins-base:0.10
	dev-perl/GStreamer-Interfaces
	gstreamer? ( media-libs/gstreamer:0.10 )
	physics? ( >=sci-physics/bullet-2.80 )
	doc? ( app-doc/doxygen )
	sdl? ( media-libs/libsdl )
	gif? ( media-libs/giflib )
	jpeg? ( virtual/jpeg )
	png? ( media-libs/libpng  )
	bidi? ( >=dev-libs/fribidi-0.19.2 )
	X? (
		x11-libs/libX11
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
	alsa? ( media-libs/alsa-lib  )
	pulseaudio? ( media-sound/pulseaudio  )
"
DEPEND="${RDEPEND}"

src_prepare() {
	if [[ ! -e configure ]] ; then
		eautopoint
		eautoreconf
	fi
}

src_configure() {
       econf \
               $(use_enable alsa) \
                $(use_enable crypto) \
                $(use_enable tests) \
                $(use_enable dbus-services) \
                $(use_enable systemd) \
                $(use_enable valgrind) \
                $(use_enable X) \
                $(use_enable wayland) \
                $(use_enable opengl) \
                $(use_enable fb) \
                $(use_enable sdl) \
                $(use_enable cocoa) \
                $(use_enable fontconfig) \
                $(use_enable bidi) \
                $(use_enable harfbuzz) \
                $(use_enable egl) \
                $(use_enable pixman) \
                $(use_enable gif) \
                $(use_enable jpeg) \
                $(use_enable png) \
                $(use_enable svg) \
                $(use_enable tiff) \
                $(use_enable webp) \
                $(use_enable glib) \
                $(use_enable gstreamer) \
                $(use_enable pulseaudio) \
                $(use_enable gesture) \
                $(use_enable physics) \
                $(use_enable multisense) \
                $(use_enable xinerama) \
                $(use_enable v4l2) \
                $(use_enable xprint) \
                $(use_enable xscreensaver) \
                $(use_enable doc)
}
src_compile() {
	use debug && append-flags -g
}

src_install() {
	default
}
