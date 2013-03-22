# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/x11-wm/enlightenment/enlightenment-0.16.9999.ebuild,v 1.40 2012/11/08 07:56:38 vapier Exp $

EAPI="4"
EGIT_REPO_URI="http://git.enlightenment.org/core/${PN}.git"
inherit git-2 autotools eutils flag-o-matic
EGIT_BRANCH="master"
SRC_URI=""
KEYWORDS="x86 amd64"

DESCRIPTION="Enlightenment Window Manager (e18)"
HOMEPAGE="http://www.enlightenment.org/"

LICENSE="BSD"
SLOT="0"
IUSE="-debug pam +nls +gadman +mixer +bluez +everything +appmenu +physics +quickaccess +shot +backlight +tasks +randr +tiling +access +music +contact"

RDEPEND=">=dev-libs/efl-1.7.9999
	>=media-libs/elementary-1.7.9999
	physics? ( dev-libs/efl[physics] )
"
DEPEND="${RDEPEND}"
PDEPEND=""

src_prepare() {
	if [[ ! -e configure ]] ; then
		eautopoint
		eautoreconf
	fi
}

src_configure() {
	econf \
		$(use_enable pam) \
		$(use_enable nls) \
		$(use_enable gadman) \
                $(use_enable mixer) \
                $(use_enable bluez bluez4) \
                $(use_enable everything) \
                $(use_enable appmenu) \
                $(use_enable physics) \
                $(use_enable quickaccess) \
                $(use_enable shot) \
                $(use_enable backlight) \
                $(use_enable tasks) \
                $(use_enable randr conf-randr) \
                $(use_enable tiling) \
                $(use_enable access) \
                $(use_enable music music-control) \
                $(use_enable contact)
}

src_compile() {
	use debug && append-flags -g
}
src_install() {
	default
}
pkg_postinst() {
	if use debug ; then
		elog "Be aware that in order for debugging to work"
		elog "FEATURES=\"splitdebug\" needs to be turned on" 
		elog "within your make.conf file"
	fi
}
