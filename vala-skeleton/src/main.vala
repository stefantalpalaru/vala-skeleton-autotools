int main (string[] args) {
    Gtk.init (ref args);

    // work around a header inclusion order bug: https://bugzilla.gnome.org/show_bug.cgi?id=618931
    const string gettext_package = Config.GETTEXT_PACKAGE;
    // localization
    Intl.bindtextdomain (gettext_package, Config2.LOCALE_DIR); 
    Intl.bind_textdomain_codeset (gettext_package, "UTF-8"); 
    Intl.textdomain (gettext_package); 
    Intl.setlocale (LocaleCategory.MESSAGES, "");

    // UI
    var builder = new Gtk.Builder ();
    try {
        builder.add_from_file (Path.build_filename (Config2.DATA_DIR, "main.ui"));
    } catch (Error e) {
        stderr.printf (_ ("UI loading error: %s\n").printf (e.message));
        return 1;
    }
    var window = builder.get_object ("window1") as Gtk.Window;
    var label = builder.get_object ("label1") as Gtk.Label;
    window.title = Config.PACKAGE_NAME;
    window.set_titlebar(null); // work around gtk+-3.12 window decoration madness
    label.label = _ ("Hello, world!\nThis is %s-%s .").printf (Config.PACKAGE, Config.PACKAGE_VERSION);
    window.destroy.connect (Gtk.main_quit);
    
    // window icon
    try {
        window.icon = Gtk.IconTheme.get_default ().load_icon (Config.PACKAGE, 48, 0);
    } catch (Error e) {
        // stderr.printf (_ ("Could not load the window icon from the default theme: %s\n").printf (e.message));
        try {
            window.icon = new Gdk.Pixbuf.from_file (Path.build_filename (Config2.ICON_DIR, @"$(Config.PACKAGE).svg"));
        } catch (Error e) {
            stderr.printf (_ ("Error loading the window icon from the SVG file: %s\n").printf (e.message));
        }
    }
    
    window.show_all ();

    Gtk.main ();
    return 0;
}

