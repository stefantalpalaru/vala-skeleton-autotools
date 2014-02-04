# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

AUTOTOOLS_AUTORECONF=yes
VALA_MIN_API_VERSION=0.16

EGIT_REPO_URI=""
inherit autotools-utils git-2 vala

DESCRIPTION=""
HOMEPAGE=""
SRC_URI=""

LICENSE=""
SLOT="0"
KEYWORDS=""
IUSE="nls"

RDEPEND="
	dev-libs/glib:2
	x11-libs/gtk+:3"
DEPEND="${RDEPEND}
	$(vala_depend)
	>=dev-util/intltool-0.50
	virtual/pkgconfig"

src_prepare() {
	vala_src_prepare
	autotools-utils_src_prepare
}

src_configure() {
	local myeconfargs=(
		$(use_enable nls)
	)
	autotools-utils_src_configure
}
