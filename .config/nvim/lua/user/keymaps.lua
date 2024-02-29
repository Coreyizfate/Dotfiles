vim.g.mapleader = " "	-- Set leader key "<leader>" to space

local keymap = vim.keymap

-- Unassign key(s)
keymap.set('n', '<space>l', '', { noremap = true }) 	-- Unmap <space>l do to interferance

-- File(s)
keymap.set("n", "<leader>fs", ":w<CR>", { noremap = true})    -- Alterative method to write file

-- Tab(s)
keymap.set("n", "<leader>to", "<cmd>tabnew<CR>") -- open new tab
keymap.set("n", "<leader>tN", "<cmd>tabnew<cr>")    -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>") -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>") --  go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>") --  go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>") --  move current buffer to new tab

-- Buffer(s)
keymap.set('n', '<leader>bN', ':enew<CR>') -- Create a new buffer
keymap.set("n", "<leader>bn", ":bn<CR>") -- go to next buffer
keymap.set('n', '<leader>bp', ':bp<CR>') -- go to previous buffer
keymap.set('n', '<leader>bs', ':scratch<CR>') -- Create a new scratch buffer

-- Window(s)  (navigation and so on)
keymap.set("n", "<leader>wh", "<C-W><C-H>", { noremap = true })    -- Move left a window
keymap.set("n", "<leader>wj", "<C-W><C-J>", { noremap = true })    -- Move down a window
keymap.set("n", "<leader>wk", "<C-W><C-K>", { noremap = true })    -- Move up a window
keymap.set("n", "<leader>wl", "<C-W><C-L>", { noremap = true })    -- Move right a window
keymap.set("n", "<M-h>", "<C-W><C-H>", { noremap = true })    -- Move left a window
keymap.set("n", "<M-j>", "<C-W><C-J>", { noremap = true })    -- Move down a window
keymap.set("n", "<M-k>", "<C-W><C-K>", { noremap = true })    -- Move up a window
keymap.set("n", "<M-l>", "<C-W><C-L>", { noremap = true })    -- Move right a window

-- Split(s)
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

-- Line(s)
keymap.set("n", "<leader>o", "printf('m`%so<ESC>``', v:count1)", {
  expr = true})  -- Add a line below without moving cursor or changing modes
keymap.set("n", "<leader>O", "printf('m`%sO<ESC>``', v:count1)", {
  expr = true})  -- Add a line above without moving cursor or changing modes

-- Text
keymap.set("n", "<leader>tU", "viwUea<Esc>")    -- Change word uppercase
keymap.set("i", "<C-U>u", "<Esc>viwUea")    -- Change word to uppercase
keymap.set("n", "<leader>tu", "viwuea<Esc>")    -- Change word to lowercase
keymap.set("i", "<C-U>l", "<Esc>viwuea")    -- Change word to lowercase
