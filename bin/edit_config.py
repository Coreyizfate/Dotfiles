import subprocess

# Define a list of config files to choose from.
app_list = [
    "alacritty",
    "autostart",
    "qtile",
    "picom",
    "zshrc",
    "aliases",
    "environment"
]

# create string with each choice on its own line
option_list = "\n".join(app_list)

# Use fzf to list each option and select one
selected_config = subprocess.run(["fzf"], input=option_list, stdout=subprocess.PIPE, text=True).stdout.strip()

# Defining list of editors to choose from
editors = [
    "nvim",
    "sublime-text",
    "Visual Studio Code",
    "Emacs"
]

editor_map = {
    "nvim": "nvim",
    "sublime-text": "subl",
    "Visual Studio Code": "code",
    "Emacs": "emacs"
}

# Each word on a new line
editors_list = "\n".join(editors)

# Using fzf to select editor and pipe back into variable
selected_editor = subprocess.run(["fzf"], input=editors_list, stdout=subprocess.PIPE, text=True).stdout.strip()

editor_command = editor_map.get(selected_editor)

config_file_map = {
    "alacritty": "/home/corey/.config/alacritty/alacritty.toml",
    "autostart": "/home/corey/bin/autostart.sh",
    "qtile": "/home/corey/.config/qtile/config.py",
    "picom": "/home/corey/.config/picom.conf",
    "zshrc": "/home/corey/.config/zsh/.zshrc",
    "aliases": "/home/corey/.config/zsh/aliases.zsh",
    "environment": "/home/corey/.config/zsh/env.zsh"
}

config_file = config_file_map.get(selected_config)

if not config_file:
    print("Please select a valid option.")
    exit(1)

final_command = f"{editor_command} {config_file}"

subprocess.run(final_command, shell=True)

print(f"Opening {config_file} with {selected_editor}")