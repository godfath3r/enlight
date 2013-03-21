# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: 

EAPI=5

DESCRIPTION="Feature rich terminal emulator using the Enlightenment Foundation Libraries"
HOMEPAGE="http://www.enlightenment.org/p.php?p=about/terminology"
EGIT_REPO_URI="http://git.enlightenment.org/apps/${PN}.git"
inherit git-2 autotools eutils
EGIT_BRANCH="master"

KEYWORDS="x86"

LICENSE="BSD-2"
SLOT="0"
IUSE=""

RDEPEND="
	>=dev-libs/efl-1.7.9999
	>=media-libs/elementary-0.17.9999
	"
DEPEND="${RDEPEND}"
#	virtual/pkgconfig"

src_prepare() {
    if [[ ! -e configure ]] ; then
#        eautopoint
		eautoreconf
    fi

}

src_install() {
	default
}
