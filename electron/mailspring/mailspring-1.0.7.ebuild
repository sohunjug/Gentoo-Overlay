# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
DESCRIPTION="MailSpring"
#HOMEPAGE="http://pinyin.sogou.com/linux/"
SRC_URI="amd64? ( https://mailspring-builds.s3.amazonaws.com/client/664204d8/linux/${PN}-${PV}-amd64.deb -> ${PN}_${PV}_amd64.deb )"

LICENSE="npm"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""
RESTRICT="mirror"

RDEPEND=""
DEPEND="${RDEPEND}"
S=${WORKDIR}

src_compile(){
  tar xf ${WORKDIR}/data.tar.xz
  rm control.tar.gz  data.tar.xz  debian-binary
  rm -rf usr/share/keyrings
  rm -rf etc/X11
}

src_install(){
  dodir /usr/share
  insinto /usr/share
  doins -r ${S}/usr/share/*
  dodir /usr/share/${PN}
  insinto /usr/share/${PN}

#  dodir /usr/lib
#  insinto /usr/lib
#  dosym libcurl.so.4 /usr/lib/libcurl-gnutls.so.4
#  dosym libgnutls.so /usr/lib/libgnutls.so.26
#  dosym librtmp.so /usr/lib/librtmp.so.0
}

pkg_preinst() {
  	dosym /usr/share/${PN}/${PN} /usr/bin/${PN}
}

pkg_postinst(){
  	chmod 755 /usr/share/${PN}/${PN}
	chmod 755 /usr/share/${PN}/resources/app.asar.unpacked/mailsync
	chmod 755 /usr/share/${PN}/resources/app.asar.unpacked/mailsync.bin
}
