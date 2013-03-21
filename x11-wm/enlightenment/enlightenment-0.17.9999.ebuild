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
	>=media-libs/elementary-1.7.9999
"
DEPEND="${RDEPEND}"
PDEPEND=""

src_prepare() {
	if [[ ! -e configure ]] ; then
		eautopoint
		eautoreconf
	fi
}

src_install() {
	default
}
