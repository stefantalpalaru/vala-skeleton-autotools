int main (string[] args) {
    Gtk.init (ref args);

    // UI
    var builder = new Gtk.Builder ();
    try {
        builder.add_from_file (Path.build_filename (Config2.DATA_DIR, "main.ui"));
    } catch (Error e) {
        stderr.printf ("UI loading error: %s\n", e.message);
        return 1;
    }
    var window = builder.get_object ("window1") as Gtk.Window;
    var label = builder.get_object ("label1") as Gtk.Label;
    window.title = Config.PACKAGE_NAME;
    label.label = @"Hello, world!\nThis is $(Config.PACKAGE)-$(Config.PACKAGE_VERSION) .";
    window.destroy.connect (Gtk.main_quit);
    
    // window icon
    try {
        window.icon = Gtk.IconTheme.get_default ().load_icon (Config.PACKAGE, 48, 0);
    } catch (Error e) {
        // stderr.printf ("Could not load the window icon from the default theme: %s\n", e.message);
        try {
            window.icon = new Gdk.Pixbuf.from_file (Path.build_filename (Config2.ICON_DIR, @"$(Config.PACKAGE).svg"));
        } catch (Error e) {
            stderr.printf ("Could not load the window icon from the SVG file: %s\n", e.message);
        }
    }
    
    window.show_all ();

    Gtk.main ();
    return 0;
}

