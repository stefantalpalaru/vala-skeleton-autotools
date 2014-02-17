EMPTY =
SUBDIRS = po
bin_PROGRAMS = vala-skeleton
vala_skeleton_SOURCES =\
		       src/config2.vala\
		       src/main.vala\
		       $(EMPTY)

vala_skeleton_VALAFLAGS = --target-glib @GLIB_VERSION@ --vapidir=$(top_srcdir)/vapi --pkg=config --pkg=gtk+-3.0

LIBS =\
      @gtk_LIBS@

AM_CFLAGS =\
	   @gtk_CFLAGS@

iconthemedir = $(datadir)/icons/hicolor
appiconscalabledir = $(iconthemedir)/scalable/apps
dist_appiconscalable_DATA = data/vala-skeleton.svg

uidir = $(pkgdatadir)/
ui_DATA = data/main.ui\
	  $(EMPTY)

desktopdir = $(datadir)/applications
desktop_in_files = data/@PACKAGE@.desktop.in
desktop_DATA = data/@PACKAGE@.desktop
@INTLTOOL_DESKTOP_RULE@

MOSTLYCLEANFILES = src/config2.vala\
				   $(desktop_DATA)

EXTRA_DIST = autogen.sh\
	     src/config2.vala.in\
	     $(ui_DATA)\
		 $(desktop_in_files).in\
	     vapi\
	     .gitignore\
	     *.ebuild\
	     $(EMPTY)

src/config2.vala: src/config2.vala.in
	sed -e 's#@ICON_DIR@#$(appiconscalabledir)#g' \
		-e 's#@DATA_DIR@#$(pkgdatadir)#g' \
		-e 's#@LOCALE_DIR@#$(datadir)/locale#g' \
		$< > $(top_srcdir)/$@

clean-local:
	-rm -f src/*.c

dist-hook:
	rm -f $(distdir)/src/config2.vala
	rm -f $(distdir)/src/*.c

