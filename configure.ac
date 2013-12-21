AC_INIT([vala skeleton], [0.1], [maintainer@domain], [vala-skeleton], [http://foo.bar])
AM_INIT_AUTOMAKE([subdir-objects])
AC_CONFIG_HEADER([config.h])

AC_PROG_CC
AM_PROG_VALAC

AC_SUBST(GLIB_VERSION, [$(pkg-config --modversion glib-2.0)])
PKG_CHECK_MODULES([gtk],[
                   gtk+-3.0  >= 3.0
                   ])

AC_CONFIG_FILES([
                 Makefile
                 ])

AC_OUTPUT
