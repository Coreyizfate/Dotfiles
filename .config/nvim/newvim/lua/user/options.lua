local g = vim.g
local o = vim.o

g.mapleader = " "
g.maplocalleader = " "

o.termguicolors = true

o.hidden = true
o.scrolloff = 12
o.number = true
o.numberwidth = 5
o.relativenumber = true
o.signcolumn = "yes:2"
o.cursorline = true

-- Editing options
o.expandtab = true
-- o.smarttab = true
o.cindent = true
o.autoindent = true
o.wrap = true
o.textwidth = 140
o.tabstop = 4
o.shiftwidth = 4

o.clipboard = "unnamedplus"

-- Case searching options, smart is only if capital in search will it be case sensitive
o.ignorecase = true
o.smartcase = true

-- Undo, Swap, backup options for saving changes to file.
o.backup = false
o.writebackup = false
o.undofile = true
o.swapfile = false
o.undodir = "~/.local/nvim/undofiles/"

o.history = 300

o.splitright = true
o.splitbelow = true

o.jumpoptions = "view"

o.smoothscroll = true
