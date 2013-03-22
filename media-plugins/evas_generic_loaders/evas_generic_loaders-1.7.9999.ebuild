# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header:

EAPI=4

DESCRIPTION="Provides external applications as generic loaders for Evas"
HOMEPAGE="http://www.enlightenment.org/"

EGIT_REPO_URI="http://git.enlightenment.org/core/${PN}.git"
inherit eutils git-2 autotools
EGIT_BRANCH="master"

LOCENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 arm x86"
IUSE="gstreamer pdf postscript raw svg"

RDEPEND="
	gstreamer? ( media-libs/gstreamer:0.10
		media-libs/gst-plugins-base:0.10 )
	pdf? ( app-text/poppler )
	postscript? ( app-text/libspectre )
	raw? ( media-libs/libraw )
	svg? ( gnome-base/librsvg
		x11-libs/cairo )"
DEPEND="${RDEPEND}"

src_prepare() {
	if [[ ! -e configure ]] ; then
		eautoreconf
	fi
}

src_configure() {
	econf \
			$(use_enable gstreamer)\
			$(use_enable pdf poppler)\
			$(use_enable postscript spectre)\
			$(use_enable raw libraw)\
			$(use_enable svg)

}

src_install() {
	default
}
