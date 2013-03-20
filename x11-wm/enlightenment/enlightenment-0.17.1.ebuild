# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/x11-wm/enlightenment/enlightenment-0.17.1.ebuild,v 1.1 2013/01/31 19:19:06 tommy Exp $

EAPI=5

MY_P=${P/_beta3/-omega}

inherit enlightenment

DESCRIPTION="Enlightenment DR17 window manager"
SRC_URI="http://download.enlightenment.org/releases/${MY_P}.tar.bz2"

LICENSE="BSD-2"
KEYWORDS="~amd64 ~x86"
SLOT="0.17/${PV}"

# The @ is just an anchor to expand from
__EVRY_MODS=""
__CONF_MODS=""
__NORM_MODS=""
IUSE_E_MODULES="
	${__CONF_MODS//@/enlightenment_modules_conf-}
	${__NORM_MODS//@/enlightenment_modules_}"

IUSE="emotion pam spell static-libs +udev ukit ${IUSE_E_MODULES}"

RDEPEND=""

DEPEND="${RDEPEND}"

S=${WORKDIR}/${MY_P}

src_prepare() {
	epatch "${FILESDIR}"/quickstart.diff
	enlightenment_src_prepare
}

src_configure() {
	export MY_ECONF="
		--disable-install-sysactions
		--disable-elementary
		$(use_enable doc)
		--disable-device-hal
		$(use_enable emotion)
		--disable-mount-hal
		$(use_enable nls)
		$(use_enable pam)
		--enable-device-udev
		$(use_enable ukit mount-udisks)
		--disable-physics
	"
	local u c
	for u in ${IUSE_E_MODULES} ; do
		u=${u#+}
		c=${u#enlightenment_modules_}
		MY_ECONF+=" $(use_enable ${u} ${c})"
	done
	enlightenment_src_configure
}

src_install() {
	enlightenment_src_install
	insinto /etc/enlightenment
	newins "${FILESDIR}"/gentoo-sysactions.conf sysactions.conf || die
}
