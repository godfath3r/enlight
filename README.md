gentoo-enlight-overlay
======================

This is my local overlay for having enlightenment-0.17.1 (latest stable) with 
recent git efl libraries (1.8 -unstable). Even though its for personal use, if
you want to have a try, continue reading.

To install it, follow these commands:
# $ su - (to become root)
# $ cd /usr/local/portage/
# $ git clone https://github.com/godfath3r/enlight.git
# $ echo "PORTDIR_OVERLAY=\"/usr/local/portage/enlight\"" >> /etc/make.conf 


_and then emerge efl, elementary and enlightenment:
# $ emerge -av efl =elementary-0.17.9999 =enlightenment-0.17.1

NOTE:
=====

Just for now, the ebuilds are dumb, they don't resolve any dependencies (will add later)
so, install whatever configures says...
