

#   |-------------------  Definitions & Imports  -----------------|

#   [[ Imports ]]
# From libqtile.utils import guess_terminal
import subprocess
from libqtile import bar, layout, widget, qtile
from libqtile.config import Click, Drag, Group, Key, KeyChord, ScratchPad, DropDown, Match, Screen
from libqtile import hook
from libqtile.lazy import lazy


#   [[ Definitions ]]
mod = "mod4"
mod1 = "mod1"
term = "kitty"
# term = "alacritty"
interm = "kitty -e"
# interm = "alacritty -e"
my_browser = "vivaldi"


#   |=========================    Keybindings Section Start    ========================|
keys = [    
    #   |---------   Most used commands/applications   ----------|
    Key([mod, "shift"], "Return", lazy.spawn("dolphin")),    # Launch dolphin file manager
    Key([mod], "w", lazy.spawn(f"{my_browser}")),            # Launch Web Browser
    Key([mod], "Return", lazy.spawn(f"{term}")),             # Launch default terminal emulator
    Key([mod, "mod1"], "Return", lazy.spawn("alacritty")),     # Launch alternative terminal emulator
    Key([mod], "e", lazy.spawn('emacsclient -c -a "emacs"')), # Launch Doom Emacs as a Client window

    #   |-------------------   Rofi Related   -------------------|
    Key([mod1], "space", lazy.spawn("rofi -show drun -modes drun,run,filebrowser")),  # Launch rofi app launcher
    Key([mod, "control"], "x",                              # Open power menu within rofi
        lazy.spawn("rofi -show power-menu -modi power-menu:rofi-power-menu -theme themes")),

    #   |---------------------   Utility   ----------------------|
    Key([mod1], "F11", lazy.spawn("pamixer -d 5")),  # Turn volume down 5%
    Key([mod1], "F12", lazy.spawn("pamixer -i 5")),  # Turn volume up 5%
    Key([], "XF86AudioLowerVolume", lazy.spawn("pamixer -d 2")),  # Turn volume down 2%
    Key([], "XF86AudioRaiseVolume", lazy.spawn("pamixer -i 2")),  # Turn volume up 2%
    Key([], "XF86AudioMute", lazy.spawn("pamixer -t")),        # Mute volume
    Key([mod], "F2", lazy.spawn("xfce4-appfinder")),         # Launch xfce's Application launcher

    #   |--------------   Qtile Window Management   ---------------|
    Key([mod], "q", lazy.window.kill()),    # Kill focused window
    Key([mod], "escape", lazy.spawn("xkill")),      # Click to kill windows
    Key([mod, "control"], "r", lazy.spawncmd()),       # Spawn Prompt
    Key([mod, "shift"], "r", lazy.reload_config()),       # Reload qtile config
    Key([mod, "control"], "q", lazy.shutdown()),        # Quit qtile to login screen
    Key([mod], "h", lazy.layout.left()),        # Focus left
    Key([mod], "l", lazy.layout.right()),       # Focus right
    Key([mod], "j", lazy.layout.down()),        # Focus below
    Key([mod], "k", lazy.layout.up()),          # Focus above
    Key([mod], "f", lazy.window.toggle_fullscreen()),   # Toggle fullscreen
    Key([mod, "control"], "v", lazy.next_layout()),     # Change to next layout
    Key([mod, "shift"], "space", lazy.window.toggle_floating()),    # Toggle floating on window
    Key([mod, mod1], "space", lazy.layout.next()),      # Cycle through windows
    Key([mod, "shift"], "h", lazy.layout.shuffle_left()),       # Swap window left
    Key([mod, "shift"], "l", lazy.layout.shuffle_right()),      # Swap window right
    Key([mod, "shift"], "j", lazy.layout.shuffle_down()),       # Swap window down
    Key([mod, "shift"], "k", lazy.layout.shuffle_up()),         # Swap window up
    Key([mod, "control"], "h", lazy.layout.shrink_main(), lazy.layout.grow_left()), # Grow left
    Key([mod, "control"], "l", lazy.layout.grow_main(), lazy.layout.grow_right()),  # Grow right
    Key([mod, "control"], "j", lazy.layout.grow(), lazy.layout.grow_down()),        # Grow down
    Key([mod, "control"], "k", lazy.layout.shrink(), lazy.layout.grow_up()),        # Grow up
    Key([mod, "control"], "n", lazy.layout.normalize()),        # Return windows

    #   |--------   Custom additions to window movements   --------|
    Key([mod], "Tab", lazy.screen.next_group()),
    Key([mod], "grave", lazy.screen.prev_group()),

    #   |===================================  KeyChords  ====================================|

        #   |-------------------   Super + Spacebar   ------------------|

    KeyChord([mod], "space", [
        Key([], "v", lazy.spawn(f"{interm} nvim")),     # Launch neovim in terminal
        Key([], "q", lazy.spawn(f"{interm} nvim /home/corey/.config/qtile/config.py")),     # Edit qtile config
        Key([], "space", lazy.spawn("xfce4-appfinder")),    # Launch xfce's application launcher
        Key([], "return", lazy.spawn(f"{interm} ranger")),  # Launch ranger in terminal
        Key([], "n", lazy.spawn("notion-app")),         # Launch notion-app
        Key([], "r", lazy.spawn("raindrop")),           # Launch bookmark manager
        Key([], "m", lazy.spawn("spotify")),            # Launch spotify music & podcasts
    ]),



        #   |----------------   Bindings for scratchpads   --------------|
    Key([mod], "s", lazy.group["scratchpad"].dropdown_toggle("term")),      # Toggle terminal scratchpad
    Key([mod], "n", lazy.group["scratchpad"].dropdown_toggle("notion")),     # Toggle notion-app
    Key([mod], "z", lazy.group["scratchpad"].dropdown_toggle("passwords")),  # Toggle password manager
    Key([mod], "v", lazy.group["scratchpad"].dropdown_toggle("volume")),    # Toggle audio mixer
],   # this bracket is needed to close out "Keys" at the very start!


#   |======================================  Groups  ==================================|

#   |----------------------   ScratchPads   ---------------------|
scratchpad = ScratchPad("scratchpad", [
        DropDown("term", "kitty --class 'catscratch' --title 'catscratch'",
                 width=0.45, height=0.38, x=0.275, y=0.518),
        DropDown("notion", "/usr/bin/notion-app"),
        DropDown("pwdmgr", "1password"),
        DropDown("volume", "pavucontrol"),
]),
#   |---------------------   Defining Groups   ------------------|
groups = []
group_names = ["1", "2", "3", "4", "5", "6", "7", "8", "9",]

#   |--------------------- Symbols Collection -------------------|
#  group_labels = ["DEV", "WWW", "SYS", "DOC", "VBOX", "CHAT", "MUS", "VID", "GFX",]
#  group_labels = ["1", "2", "3", "4", "5", "6", "7", "8", "9",]
# Save icons: 󰘾  󰈸 󱠆 󱠇  󰈹  󰭘 󰡉  󰪮 󰘽 󰄹 󰋯 󰊯   󰊶   󰺿 󰹕   󰠮    󰘨  󱂅  󰠥 󰄲 󰮒   󰕹  󰐭 󰪁 
#          󰞽 󱊷 󱎧󰖹    󱎣   󰫧 󱄑 󰟽 󱨜 󰠾 󰗰 󰫍 󰫎 󰏗 󱦐                         
#                   󰇮 
# Seperators:                

group_labels = ["󰈹", "", "", "", "", "", "", "󰉓", "",]
group_layouts = ["monadtall", "monadtall", "monadtall", "monadtall", "monadtall", "monadtall", "monadtall", "monadtall", "monadtall"]
#  groups = [Group(i) for i in "123456789"] # Default method for groups

for i in groups:
    keys.extend(
        [
            # mod1 + group number = switch to group
            Key(
                [mod],
                i.name,
                lazy.group[i.name].toscreen(),
                desc="Switch to group {}".format(i.name),
            ),
            Key(
                [mod, "shift"],
                i.name,
                lazy.window.togroup(i.name, switch_group=True),
                desc="Switch to & move focused window to group {}".format(i.name),
            ),
        ]
    )
groups.append(scratchpad)


#   |=====================================  Layouts  ==================================|

layouts = [
    layout.MonadTall(
        margin=13,
        border_width=4,
        border_focus="#4E8AD4",
        border_normal="#9D9FA1",
        corner_radius=10,
    ),
    layout.Max(
        margin=1,
        border_width=0,
        corner_radius=0,
    ),
    layout.Matrix(
        margin=13,
        border_width=4,
        border_focus="#4E8AD4",
        border_normal="#9D9FA1",
    ),
    layout.MonadWide(
        margin=13,
        border_width=4,
        border_focus="#4E8AD4",
        border_normal="#9D9FA1",
    ),
    #layout.Floating(
    #    border_width=0,
    #    fullscreen_border_width=0,
    #    max_border_width=0,
    #    border_focus="#000000",
    #    border_normal="#000000",
    #),
    #layout.Columns(
    #    margin=13,
    #    border_width=4,
    #    border_focus="#4E8AD4",
    #    border_normal="#9D9FA1",
    #),
    # layout.Stack(num_stacks=4),
    # layout.Bsp(),
    # layout.RatioTile(),
    # layout.Tile(),
    # layout.TreeTab(),
    # layout.VerticalTile(),
    # layout.Zoomy(),
]



#   |---------------------------   BAR   ------------------------|


widget_defaults = dict(
    font="Hack Nerd Font",
    fontsize=16,
    padding=8,
)
extension_defaults = widget_defaults.copy()

#   |--------------------------   Colors   ----------------------|

dark_blue = "#12204a"
burnt_orange = "#b95e23"
sky_blue = "#87BCDE"
dim_grey = "#686963"
orange = "#F19A3E"
beaver = "#877666"
tangerine = "#FF934F"
cream = "#E7EFC5"
khaki = "#BBAB8B"
LIGHT_GREY = "#484848"
GREY = "#222222"
DARK_GREY = "#111111"
BLUE = "#007fdf"
DARK_BLUE = "#002a4a"
ORANGE = "#dd6600"
DARK_ORANGE = "#371900"

screens = [
    Screen(
        wallpaper='/home/corey/Pictures/wallpapers/ ',
        wallpaper_mode='stretch',
        top=bar.Bar(
            [
                widget.Spacer(length=10, background=GREY),
                widget.CurrentLayoutIcon(
                    scale=.65,
                    background=GREY,
                    padding=8,
                ),
                widget.TextBox(text='', foreground=GREY, fontsize=44, padding=-1),
                widget.Spacer(length=24),
                widget.Memory(measure_mem='G', format='{MemUsed:.0f}GB({MemPercent:.0f}%)'),
                widget.Spacer(length=bar.STRETCH),
                widget.GroupBox(
                    fontsize=26,
                    active=sky_blue,
                    inactive=khaki,
                    block_highlight_text_color=burnt_orange,
                    borderwidth=0,
                    spacing=6,
                    padding=7,
                ),
                widget.Spacer(length=bar.STRETCH),
                # widget.Bluetooth(symbol_discovery=' 󱛇 ', symbol_connected=' 󰂱 '),
                widget.Volume(
                    channel='Master',
                    volume_app='pavucontrol',
                    volume_down_command='pamixer -d 5',
                    volume_up_command='pamixer -i 5',
                    mute_command='pamixer -t',
                ),
                widget.Systray(),
                widget.TextBox(text='', foreground=dark_blue, fontsize=44, padding=-1),
                widget.Clock(format="%m-%d-%Y %a %I:%M %p", background=dark_blue, padding=15),
                # NB Systray is incompatible with Wayland, consider using StatusNotifier instead
                # widget.StatusNotifier(),
            ],
            41,
            # background="#182954",
            margin=[8, 8, 0, 8],
            background=DARK_GREY,
            # border_width=[8, 8, 8, 8],  # Draw top and bottom borders
            # border_color=["#182954"]  # Borders are magenta
        ),
        # You can uncomment this variable if you see that on X11 floating resize/moving is laggy
        # x11_drag_polling_rate = 60, -Set to no cap by default, you can set it to 60 to limit it to 60 events per second
    ),
]

#   |===========================   Extra Minor Settings   ===============================|

#   |--------------------  Mouse & Key Settings  --------------------|
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(), start=lazy.window.get_position()),  # Move window
    Drag([mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()),          # Resize
    Click([mod], "Button1", lazy.window.bring_to_front()),                                          # Bring to front
]
dgroups_key_binder = None
dgroups_app_rules = []  # type: list
follow_mouse_focus = False
bring_front_click = False            # bring_front_click = "floating_only"
floats_kept_above = True
cursor_warp = False

#   |--------------------  Additional Setting  ----------------------|
floating_layout = layout.Floating(
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),               # gitk
        Match(wm_class="makebranch"),                 # gitk
        Match(wm_class="maketag"),                    # gitk
        Match(wm_class="ssh-askpass"),                # ssh-askpass
        Match(wm_class="Lxappearance"),               # lxappearance
        Match(wm_class="ulauncher"),                  # ulauncher
        Match(title="branchdialog"),                  # gitk
        Match(title="pinentry"),                      # GPG key password entry
    ]
)

auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

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
