# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PPR="beta.13"
DESCRIPTION="Franz."
#HOMEPAGE="http://pinyin.sogou.com/linux/"
SRC_URI="amd64? ( https://github.com/meetfranz/franz/releases/download/v${PV}-${PPR}/${PN}_${PV}-${PPR}_amd64.deb -> ${PN}_${PV}-${PPR}_amd64.deb )"

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
  dodir /opt
  insinto /opt
  insopts -m0755
  doins -r ${S}/opt/*
  dodir /usr/share/applications
  insinto /usr/share/applications
  install -D ${S}/usr/share/applications/*
  dodir /usr/share
  insinto /usr/share
  doins -r ${S}/usr/share/*
  dosym /opt/Franz/${PN} /usr/bin/${PN}

#  dodir /usr/lib
#  insinto /usr/lib
#  dosym libcurl.so.4 /usr/lib/libcurl-gnutls.so.4
#  dosym libgnutls.so /usr/lib/libgnutls.so.26
#  dosym librtmp.so /usr/lib/librtmp.so.0
}

pkg_postinst(){
	einfo
	einfo "franz 5.0.0-beta.13"
}
