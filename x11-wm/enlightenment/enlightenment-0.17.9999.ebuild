# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/x11-wm/enlightenment/enlightenment-0.16.9999.ebuild,v 1.40 2012/11/08 07:56:38 vapier Exp $

EAPI="4"
EGIT_REPO_URI="http://git.enlightenment.org/core/${PN}.git"
inherit git-2 autotools
EGIT_BRANCH="master"
SRC_URI=""
KEYWORDS="x86 amd64 arm"

inherit eutils

DESCRIPTION="Enlightenment Window Manager (e18)"
HOMEPAGE="http://www.enlightenment.org/"

LICENSE="BSD"
SLOT="0"
IUSE="+access +appmenu +backlight +battery +bluez4 +clock +conf conf2
+conf-applications +conf-bindings +conf-comp +conf-dialogs +conf-display
+conf-interaction +conf-intl +conf-menus +conf-paths +conf-randr +conf-shelves
+conf-theme +conf-wallpaper2 +conf-window-manipulation +conf-window-remembers
+connman +contact +cpufreq +doc +eeze +elementary +emotion +enlightenment-menu
+enotify +ephysics +ephysics +everything +fileman +fileman-opinfo +files +gadman
+hal +ibar +ibox +illume2 +mixer +msgbus +music-control +nls +notification
+pager +pam +physics +quickaccess +rpath +shot simple-x11 +start +sysactions +syscon
+systray +tasks +temperature +tiling +udev +udisks +wayland-clients +winlist
+wizard +xkbswitch"

RDEPEND=">=dev-libs/efl-1.7.9999
		>=media-libs/elementary-1.7.9999
		ephysics? ( dev-libs/efl[physics] )
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
		$(use_enable pam)\
		$(use_enable simple-x11)\
		$(use_enable nls)\
		$(use_enable rpath)\
		$(use_enable sysactions install-sysactions)\
		$(use_enable enlightenment-menu)\
		$(use_enable files)\
		$(use_enable hal device-hal)\
		$(use_enable udev device-udev)\
		$(use_enable udisks mount-udisks)\
		$(use_enable eeze mount-eeze)\
		$(use_enable doc)\
		$(use_enable elementary)\
		$(use_enable emotion)\
		$(use_enable enotify)\
		$(use_enable ephysics)\
		$(use_enable wayland-clients)\
		$(use_enable ibar)\
		$(use_enable clock)\
		$(use_enable pager)\
		$(use_enable battery)\
		$(use_enable temperature)\
		$(use_enable notification)\
		$(use_enable cpufreq)\
		$(use_enable ibox)\
		$(use_enable start)\
		$(use_enable winlist)\
		$(use_enable fileman)\
		$(use_enable fileman-opinfo)\
		$(use_enable wizard)\
		$(use_enable conf)\
		$(use_enable conf2)\
		$(use_enable conf-comp)\
		$(use_enable conf-wallpaper2)\
		$(use_enable conf-theme)\
		$(use_enable conf-intl)\
		$(use_enable msgbus)\
		$(use_enable conf-applications)\
		$(use_enable conf-display)\
		$(use_enable conf-shelves)\
		$(use_enable conf-bindings)\
		$(use_enable conf-window-remembers)\
		$(use_enable conf-window-manipulation)\
		$(use_enable conf-menus)\
		$(use_enable conf-dialogs)\
		$(use_enable conf-performance)\
		$(use_enable conf-paths)\
		$(use_enable conf-interaction)\
		$(use_enable gadman)\
		$(use_enable mixer)\
		$(use_enable connman)\
		$(use_enable bluez4)\
		$(use_enable illume2)\
		$(use_enable syscon)\
		$(use_enable everything)\
		$(use_enable systray)\
		$(use_enable appmenu)\
		$(use_enable physics)\
		$(use_enable quickaccess)\
		$(use_enable shot)\
		$(use_enable backlight)\
		$(use_enable tasks)\
		$(use_enable conf-randr)\
		$(use_enable xkbswitch)\
		$(use_enable tiling)\
		$(use_enable access)\
		$(use_enable music-control)\
		$(use_enable contact)
}

src_install() {
	default
}
