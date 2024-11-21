local options = {
    backup = true,
    ignorecase = true,
    showmode = true,
    smartindent = true,
    splitbelow = true,
    splitright = true,
    swapfile = false,
    undofile = true,
    expandtab = true,
    shiftwidth = 4, -- the number of spaces inserted for each indentation
    tabstop = 4, -- insert 2 spaces for a tab
    cursorline = true, -- highlight the current line
    number = true, -- set numbered lines
    relativenumber = true, -- set relative numbered lines
    numberwidth = 5, -- set number column width to 4 {default 4}
    signcolumn = "yes", -- always show the sign column, otherwise it would shift the text each time
    wrap = false, -- display lines as one long line
    scrolloff = 8, -- minimal number of columns to scroll horizontally.
    sidescrolloff = 8, -- minimal number of screen columns
    lazyredraw = false, -- Won't be redrawn while executing macros, register and other commands.
    termguicolors = true, -- Enables 24-bit RGB color in the TUI
    fillchars = { eob = " ", fold = " ", foldopen = "", foldsep = " ", foldclose = "", lastline = " " }, -- make EndOfBuffer invisible
    ruler = false, -- show the line and column number of the cursor position``
    cmdheight = 4, -- height of the command line
    helpheight = 10,
}
