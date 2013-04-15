enlight overlay
===============

This is my local overlay for having enlightenment 0.17.2.1 (latest stable) with 
recent git efl libraries (1.8 -unstable). Even though its for personal use, if
you want to have a try, continue reading.

To setup the repository, follow these commands:
```bash
$ su - *(to become root)*
$ mkdir -p /usr/local/portage
$ cd /usr/local/portage/
$ git clone https://github.com/godfath3r/enlight.git
(if you have old gentoo install)
$ echo "PORTDIR_OVERLAY=\"/usr/local/portage/enlight \$PORTDIR_OVERLAY\"" >> /etc/make.conf
(OR for new installations)
$ echo "PORTDIR_OVERLAY=\"/usr/local/portage/enlight \$PORTDIR_OVERLAY\"" >> /etc/portage/make.conf 
```
You can always consult gentoo wiki:
http://wiki.gentoo.org/wiki/Overlay#Treatment_of_overlays

To install efl, elementary and enlightenment:
```bash
$ emerge -av efl =elementary-1.7.9999 =enlightenment-0.17.1
```
To install efl, elementary and git enlightenment:
```bash
$ emerge -av efl =elementary-1.7.9999 =enlightenment-0.17.9999
```

**NOTE:**
Just for now, the ebuilds are dumb, they just resolve basic dependencies 
(will fix flags usage etc later...)

