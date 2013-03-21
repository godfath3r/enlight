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
IUSE=""

RDEPEND=""
DEPEND=">=dev-libs/efl-0.17.9999"
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
