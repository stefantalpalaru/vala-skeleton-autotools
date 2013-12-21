bin_PROGRAMS=vala-skeleton
vala_skeleton_SOURCES=\
					  src/config.vala\
					  src/main.vala\
					  $(NONE)

CLEANFILES = src/config.vala

vala_skeleton_VALAFLAGS= --target-glib @GLIB_VERSION@ --vapidir=$(top_srcdir)/vapi --pkg=gtk+-3.0

LIBS=\
	 @gtk_LIBS@

AM_CFLAGS=\
		  @gtk_CFLAGS@

iconthemedir = $(datadir)/icons/hicolor
appiconscalabledir = $(iconthemedir)/scalable/apps
dist_appiconscalable_DATA = data/vala-skeleton.svg

src/config.vala: src/config.vala.in
	sed -e 's#@ICON_DIR@#$(appiconscalabledir)#g' $< > $@

clean-local:
	-rm -f src/*.c

