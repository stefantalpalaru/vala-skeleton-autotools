bin_PROGRAMS = vala-skeleton
vala_skeleton_SOURCES =\
					   src/config2.vala\
					   src/main.vala\
					   $(NONE)

CLEANFILES = src/config2.vala

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
		  $(NONE)

EXTRA_DIST = src/config2.vala.in\
			 $(ui_DATA)\
			 $(NONE)

src/config2.vala: src/config2.vala.in
	sed -e 's#@ICON_DIR@#$(appiconscalabledir)#g' \
		-e 's#@DATA_DIR@#$(pkgdatadir)#g' \
		$< > $@

clean-local:
	-rm -f src/*.c

