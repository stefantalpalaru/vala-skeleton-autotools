using Gtk;
using Config;

int main (string[] args) {
    Gtk.init (ref args);

    var window = new Window ();

    // window icon
    try {
        window.icon = IconTheme.get_default ().load_icon ("vala-skeleton", 48, 0);
    } catch (Error e) {
        stderr.printf ("Could not load the window icon from the default theme: %s\n", e.message);
        try {
            window.icon = new Gdk.Pixbuf.from_file (Path.build_filename(Config.ICON_DIR, "vala-skeleton.svg"));
        } catch (Error e) {
            stderr.printf ("Could not load the window icon from the SVG file: %s\n", e.message);
        }
    }
    
    window.title = "Vala skeleton";
    window.window_position = WindowPosition.CENTER;
    window.set_default_size (400, 100);
    window.destroy.connect (Gtk.main_quit);
    var label = new Label("Hello, world!");
    window.add (label);
    window.show_all ();

    Gtk.main ();
    return 0;
}

