# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/x11-wm/enlightenment/enlightenment-0.16.9999.ebuild,v 1.40 2012/11/08 07:56:38 vapier Exp $

EAPI="4"
EGIT_REPO_URI="http://git.enlightenment.org/core/${PN}.git"
inherit git-2 autotools
EGIT_BRANCH="master"
SRC_URI=""
KEYWORDS="x86 amd64"

inherit eutils

DESCRIPTION="Enlightenment Window Manager (e18)"
HOMEPAGE="http://www.enlightenment.org/"

LICENSE="BSD"
SLOT="0"
IUSE=""

RDEPEND=">=dev-libs/efl-1.7.9999
<<<<<<< HEAD
	>=media-libs/elementary-1.7.9999
"
DEPEND="${RDEPEND}"
PDEPEND=""
=======
	pulseaudio? ( media-sound/pulseaudio )
	dbus? ( sys-apps/dbus )
	pango? ( x11-libs/pango )
	=media-libs/freetype-2*
	>=media-libs/imlib2-1.3.0[X]
	x11-libs/libSM
	x11-libs/libICE
	x11-libs/libX11
	x11-libs/libXext
	x11-libs/libXfixes
	x11-libs/libXdamage
	x11-libs/libXxf86vm
	x11-libs/libXft
	xrandr? ( x11-libs/libXrandr )
	x11-libs/libXrender
	x11-misc/xbitmaps
	xinerama? ( x11-libs/libXinerama )
	xcomposite? ( x11-libs/libXcomposite )
	nls? ( virtual/libintl )
	virtual/libiconv"
DEPEND="${RDEPEND}
	virtual/pkgconfig
	x11-proto/xextproto
	x11-proto/xf86vidmodeproto
	xinerama? ( x11-proto/xineramaproto )
	xcomposite? ( x11-proto/compositeproto )
	x11-proto/xproto
	nls? ( sys-devel/gettext )"
PDEPEND="doc? ( app-doc/edox-data )"
>>>>>>> 248a72de2475677f40d3e420a68bf8d0dd6fe4c0

src_prepare() {
	if [[ ! -e configure ]] ; then
		eautopoint
		eautoreconf
	fi
}

src_install() {
	default
}
