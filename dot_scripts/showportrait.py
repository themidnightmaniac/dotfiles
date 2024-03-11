import gi
gi.require_version('GdkPixbuf', '2.0')
from gi.repository import GdkPixbuf
gi.require_version("Gtk", "3.0")
from gi.repository import Gtk, Gdk
import sys

img = sys.argv[1]
xpos = int(sys.argv[2])
ypos = int(sys.argv[3])
w = int(sys.argv[4])
h = int(sys.argv[5])

class ShowPortrait(Gtk.Window):

    def __init__(self):
        Gtk.Window.__init__(self, title="PortraitonMyDesktop")
        self.set_type_hint(Gdk.WindowTypeHint.DESKTOP)
        self.connect("destroy", Gtk.main_quit)
        self.set_skip_taskbar_hint(True)
        pixbuf = GdkPixbuf.Pixbuf.new_from_file_at_scale(
            img, w, h, preserve_aspect_ratio=True,
            )
        image = Gtk.Image.new_from_pixbuf(pixbuf)
        self.add(image)
        self.move(xpos, ypos)
        self.show_all()

ShowPortrait()
Gtk.main()
