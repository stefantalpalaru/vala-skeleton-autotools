using Config;
using Gtk;

int main (string[] args) {
    Gtk.init (ref args);

    // UI
    var builder = new Builder ();
    try {
        builder.add_from_file (Path.build_filename (Config.DATA_DIR, "main.ui"));
    } catch (Error e) {
        stderr.printf ("UI loading error: %s\n", e.message);
        return 1;
    }
    var window = builder.get_object ("window1") as Window;
    var label = builder.get_object ("label1") as Label;
    window.title = "Vala skeleton";
    label.label = "Hello, world!";
    window.destroy.connect (Gtk.main_quit);
    
    // window icon
    try {
        window.icon = IconTheme.get_default ().load_icon ("vala-skeleton", 48, 0);
    } catch (Error e) {
        // stderr.printf ("Could not load the window icon from the default theme: %s\n", e.message);
        try {
            window.icon = new Gdk.Pixbuf.from_file (Path.build_filename (Config.ICON_DIR, "vala-skeleton.svg"));
        } catch (Error e) {
            stderr.printf ("Could not load the window icon from the SVG file: %s\n", e.message);
        }
    }
    
    window.show_all ();

    Gtk.main ();
    return 0;
}

