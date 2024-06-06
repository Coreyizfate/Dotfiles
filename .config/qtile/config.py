# Copyright (c) 4010 Aldo Cortesi
# Copyright (c) 4010, 4014 dequis
# Copyright (c) 4014 Randall Ma
# Copyright (c) 4014-4014 Tycho Andersen
# Copyright (c) 4014 Craig Barnes
# Copyright (c) 4013 horsik
# Copyright (c) 4013 Tao Sauvage
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.


# from libqtile.utils import guess_terminal
import subprocess
from libqtile import bar, layout, widget, qtile
from libqtile.config import (
    Click,
    Drag,
    Group,
    Key,
    KeyChord,
    ScratchPad,
    DropDown,
    Match,
    Screen,
)
from libqtile import hook
from libqtile.lazy import lazy


#   DEFINITIONS
mod = "mod4"
mod1 = "mod1"
term = "kitty"
# term = "alacritty"
interm = "kitty -e"
# interm = "alacritty -e"
my_browser = "firefox-nightly"
alt_browser = "chromium"

#           |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
keys = [  # ==========  Keybindings Section Start  ============= #
    #   |---------   Most used commands/applications   ----------|
    Key([mod, "shift"], "Return", lazy.spawn("thunar")),  # Launch Dolphin
    Key([mod], "w", lazy.spawn(f"{my_browser}")),  # Launch Web Browser
    Key([mod, "shift"], "w", lazy.spawn(f"{alt_browser}")),  # Launch Alt Browser
    Key([mod], "Return", lazy.spawn(f"{term}")),  # Launch default terminal
    Key([mod, "mod1"], "Return", lazy.spawn("alacritty")),  # Launch alternative terminal
    Key([mod], "F2", lazy.spawn("xfce4-appfinder")),  # Launch xfce4-appfinder
    Key([mod], "F9", lazy.spawn("flameshot gui")), # Take a screenshot (draw a box)
    Key([mod], "c", lazy.spawn("code")),        # Launch Visual Studio Code
    Key([mod], "e", lazy.spawn("gedit")),       # Launch GEdit (lightweight text editor)
    Key([mod, "shift"], "e", lazy.spawn("subl")),   # Launch Sublime-Text-4
    Key([mod], "space", lazy.spawn("xfce4-appfinder")), # Launch xfce4-appfinder
    Key([mod], "z", lazy.spawn("nordpass")),    # Launch NordPass
    Key([mod], "n", lazy.spawn("notion-app")),      # Launch Notion
    Key([mod], "r", lazy.spawn("raindrop")),  # Launch Raindrop.io
    Key([mod], "m", lazy.spawn("spotify")),   # Launch Spotify
    #   |---------------------   Utility   ----------------------|
    Key(["control"], "F11", lazy.spawn("pamixer -d 5")),  # Turn volume down 5%
    Key(["control"], "F12", lazy.spawn("pamixer --allow-boost -i 5")),  # Turn volume up 5%
    Key([], "XF86AudioLowerVolume", lazy.spawn("pamixer -d 2")),  # Turn volume down 2%
    Key([], "XF86AudioRaiseVolume", lazy.spawn("pamixer --allow-boost -i 2")),  # Turn volume up 2%
    Key([], "XF86AudioMute", lazy.spawn("pamixer -t")),  # Mute volume
    #   |-------------------   Rofi scripts   -------------------|
    Key([mod, "control"], "x", lazy.spawn("rofi -show power-menu -modi power-menu:rofi-power-menu -theme glue_pro_blue")),
    Key([mod1], "space", lazy.spawn("rofi -show drun -modes drun,run")),  # Launch rofi app launcher
    #   |--------------   Qtile Window Management   ---------------|
    Key([mod], "q", lazy.window.kill()),  # Kill focused window
    Key([mod], "escape", lazy.spawn("xkill")),  # Click to kill windows
    Key([mod, "shift"], "r", lazy.spawncmd()),  # Spawn Prompt
    Key([mod, "control"], "r", lazy.reload_config()),  # Reload qtile config
    Key([mod, "control"], "q", lazy.shutdown()),  # Quit qtile to login screen
    Key([mod], "h", lazy.layout.left()),  # Focus left
    Key([mod], "l", lazy.layout.right()),  # Focus right
    Key([mod], "j", lazy.layout.down()),  # Focus below
    Key([mod], "k", lazy.layout.up()),  # Focus above
    Key([mod], "f", lazy.window.toggle_fullscreen()),  # Toggle fullscreen
    Key([mod, "control"], "v", lazy.next_layout()),  # Change to next layout
    Key([mod, "shift"], "f", lazy.window.toggle_floating()),  # Toggle floating on window
    Key([mod, "control"], "space", lazy.layout.next()),  # Cycle through windows
    Key([mod, "shift"], "h", lazy.layout.shuffle_left()),  # Swap window left
    Key([mod, "shift"], "l", lazy.layout.shuffle_right()),  # Swap window right
    Key([mod, "shift"], "j", lazy.layout.shuffle_down()),  # Swap window down
    Key([mod, "shift"], "k", lazy.layout.shuffle_up()),  # Swap window up
    Key([mod, "control"], "h", lazy.layout.shrink_main(), lazy.layout.grow_left()),  # Grow left
    Key([mod, "control"], "l", lazy.layout.grow_main(), lazy.layout.grow_right()),  # Grow right
    Key([mod, "control"], "j", lazy.layout.grow(), lazy.layout.grow_down()),  # Grow down
    Key([mod, "control"], "k", lazy.layout.shrink(), lazy.layout.grow_up()),  # Grow up
    Key([mod, "control"], "n", lazy.layout.normalize()),  # Return windows

    #   |--------   Custom additions to window movements   --------|

    # Key([mod], "Tab", lazy.screen.next_group(), desc="Move to next group"),
    # Key([mod], "grave", lazy.screen.prev_group(), desc="Move to previous group"),

    #   ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
    #   |===================================  KeyChords  ====================================|
    #   ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||

    #                                [ Waiting For Something To Put Here ]

    #   |----------------   Bindings for scratchpads   --------------|

    Key([mod], "d", lazy.group["scratchpad"].dropdown_toggle("altterm")),

    Key([mod, "control"], "d", lazy.group["scratchpad"].dropdown_toggle("centerterm")),
    Key([mod], "a", lazy.group["scratchpad"].dropdown_toggle("centerterm")),

    Key([mod], "s", lazy.group["scratchpad"].dropdown_toggle("term")),

    Key([mod], "v", lazy.group["scratchpad"].dropdown_toggle("volume")),

    Key([mod], "y", lazy.group["scratchpad"].dropdown_toggle("termfilemgr")),

]
#   ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
#   |======================================  Groups  ==================================|
#   ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||

#   |----------------------   ScratchPads   ---------------------|
scratchpad = ScratchPad(
    "scratchpad",
    [
        DropDown("centerterm", "kitty --class centerterm",
                 height=0.6, width=0.7, x=0.15, y=0.27, opacity=0.75),

        DropDown("termfilemgr", "kitty --class yaziterm -e yazi",
                 height=0.7, width=0.8, x=0.1, y=0.15, opacity=0.9),

        DropDown("altterm", "kitty --class altterm",
                 height=0.845, width=0.3, x=0.695, y=0.145, opacity=0.75),

        DropDown("term", "kitty --class scratchterm",
                 x=0.1125, y=0.6, width=0.75, height=0.375, opacity=0.75),

        DropDown("volume", "pavucontrol",
                 height=0.65, width=0.275, x=0.715, y=0.1, opacity=0.7),
    ],
)
#   |---------------------   Defining Groups   ------------------|
groups = []
group_names = [
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
]
#  group_labels = ["DEV", "WWW", "SYS", "DOC", "VBOX", "CHAT", "MUS", "VID", "GFX",]
#  group_labels = ["1", "2", "3", "4", "5", "6", "7", "8", "9",]
group_labels = [
    "󰈹 ",
    " ",
    " ",
    " ",
    " ",
    " ",
    " ",
    "󰉓 ",
    " ",
]
group_layouts = [
    "monadtall",
    "monadtall",
    "monadtall",
    "monadtall",
    "monadtall",
    "monadtall",
    "monadtall",
    "monadtall",
    "monadtall",
]
#  groups = [Group(i) for i in "123456789"] # Default method for groups

for i in range(len(group_names)):
    groups.append(
        Group(
            name=group_names[i],
            layout=group_layouts[i].lower(),
            label=group_labels[i],
        )
    )
for i in groups:
    keys.extend(
        [
            Key(
                [mod],
                i.name,
                lazy.group[i.name].toscreen(),
                desc="mod1 + letter of group = switch to group".format(i.name),
            ),
            Key(
                [mod, "shift"],
                i.name,
                lazy.window.togroup(i.name, switch_group=True),
                desc="mod1 + shift + letter of group = switch to & move focused window to group".format(
                    i.name
                ),
            ),
        ]
    )
groups.append(scratchpad)

#   ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
#   |=====================================  Layouts  ==================================|
#   ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||

layouts = [
    layout.MonadTall(
        margin=-1,
        border_width=7,
        border_focus="#4E8AD4",
        border_normal="#9D9FA1",
    ),
    layout.Max(
        margin=0,
        # border_width=6,
        # border_focus="#4E8AD4",
        # border_normal="#9D9FA1",
    ),
    # layout.Floating(),
    # layout.Matrix(),
    # layout.MonadWide(),
    layout.Columns(
        margin=-1,
        border_width=7,
        border_focus="#4E8AD4",
        border_normal="#9D9FA1",
    ),
    layout.TreeTab(
        margin=0,
        border_width=0,
        border_focus="#4E8AD4",
        border_normal="#9D9FA1",
    ),
    # layout.Bsp(),
    # Try more layouts by unleashing below layouts.
    # layout.Stack(num_stacks=4),
    # layout.RatioTile(),
    # layout.Tile(),
    # layout.VerticalTile(),
    # layout.Zoomy(),
]

#   |--------------------------   Colors   ----------------------|

dark_blue = "#12204a"  #  Space cadet
burnt_orange = "#b95e23"  #  Burnt orange
sky_blue = "#87BCDE"  #  Carolina blue
#   ----------------------------------------|
dim_grey = "#686963"  #  Dim grey
orange = "#F19A3E"  #  Carrot orange
beaver = "#877666"  #  Beaver
tangerine = "#FF934F"  #  Atomic tangerine
cream = "#E7EFC5"  #  Cream
khaki = "#BBAB8B"  #  Khaki
# I quite like the theme "tokyonight" used here in lazy.nvim starter.

#   |---------------------------   BAR   ------------------------|

widget_defaults = dict(
    font="JetBrainsMono Nerd Font",
    fontsize=18,
    padding=3,
)
extension_defaults = widget_defaults.copy()

screens = [
    Screen(
        wallpaper="/home/corey/Pictures/wallpapers/blue-darkblue-black-geometric-pattern-3554x1999.jpg",
        wallpaper_mode="fill",
        top=bar.Bar(
            [
                widget.Sep(),
                widget.CurrentLayout(),
                widget.Sep(),
                widget.GroupBox(
                    fontsize=26,
                    spacing=1,
                ),
                widget.Sep(),
                widget.Prompt(),
                widget.WindowName(),
                widget.Chord(
                    chords_colors={
                        "launch": ("#4E8AD4", "#ffffff"),
                    },
                    name_transform=lambda name: name.upper(),
                ),
                # NB Systray is incompatible with Wayland, consider using StatusNotifier instead
                # widget.StatusNotifier(),
                widget.Sep(),
                widget.Volume(),
                widget.Sep(),
                widget.Systray(),
                widget.Sep(),
                widget.Clock(format="%m/%d/%Y"),
                widget.Sep(),
                widget.Clock(format="%a %I:%M %p"),
                widget.Sep(),
            ],
            42,
            background="#182954",
            #  background="#606567",
            #  margin=[10, 15, 0, 15],
            #  border_width=[3, 3, 3, 3],  # Draw top and bottom borders
            #  border_color=["#fffff"]  # Borders are magenta
        ),
        # You can uncomment this variable if you see that on X11 floating resize/moving is laggy
        # x11_drag_polling_rate = 60, -Set to no cap by default, you can set it to 60 to limit it to 60 events per second
    ),
]

#   |||||||||||||||     MOUSE SETTINGS & BINDINGS       |||||||||||||||
#   ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
#   |====================================   Mouse   ===================================|
#   ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||

mouse = [
    Drag(
        [mod],
        "Button1",
        lazy.window.set_position_floating(),
        start=lazy.window.get_position(),
    ),  # Move window
    Drag(
        [mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()
    ),  # Resize
    Click([mod], "Button1", lazy.window.bring_to_front()),  # Bring to front
]
dgroups_key_binder = None
dgroups_app_rules = []  # type: list
follow_mouse_focus = False
#  bring_front_click = "floating_only"
bring_front_click = True
floats_kept_above = True
cursor_warp = False
floating_layout = layout.Floating(
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(title="branchdialog"),  # gitk
        Match(title="pinentry"),  # GPG key password entry
        Match(wm_class="copyq"),    # CopyQ Clipboard Manager
    ]
)

auto_fullscreen = False
focus_on_window_activation = "smart"
reconfigure_screens = False

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True

# When using the Wayland backend, this can be used to configure input devices.
wl_input_rules = None

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "QTile"

#   |---------------------------   Autostart on launch   --------------------------|


@hook.subscribe.startup_once
def autostart():
    subprocess.call(["/home/corey/bin/autostart.sh"])
