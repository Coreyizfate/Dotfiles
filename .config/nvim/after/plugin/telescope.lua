local builtin = require('telescope.builtin')

local keymap = vim.keymap

require('telescope').load_extension('fzf')
require('telescope').load_extension('noice')
require('telescope').load_extension('undo')
require('telescope').load_extension('harpoon')
require('telescope').setup({
    extensions = {
        fzf = {
            fuzzy = true, -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true, -- override the file sorter
            case_mode = "smart_case", -- or "ignore_case" or "respect_case"
        },
        undo = {
            use_delta = true,
            entry_format = "state #$ID, $STAT, $TIME",
            time_format = "",
            saved_only = false,
        },
    },
})

keymap.set('n', '<leader>la', builtin.builtin, {})        -- List telescopes builtin pickers
keymap.set('n', '<leader>lp', builtin.builtin, {})        -- List telescopes builtin pickers
keymap.set('n', '<leader>lf', builtin.find_files, {})     -- Find file
keymap.set('n', '<leader>lg', function()                  -- Live grep
    builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)
keymap.set('n', '<leader>fb', builtin.buffers, {})      -- List currently open buffers
keymap.set('n', '<leader>lb', builtin.buffers, {})      -- List currently open buffers
keymap.set('n', '<leader>fh', builtin.help_tags, {})    -- Search help tags and display help window
keymap.set('n', '<leader>h', builtin.help_tags, {})    -- Search help tags and display help window
keymap.set('n', '<leader>lr', builtin.oldfiles, {})     -- Lists previously opened/recent files

keymap.set('n', '<leader>/', builtin.current_buffer_fuzzy_find, {}) -- Fuzzy find inside current file
keymap.set('n', '<leader>fs', builtin.current_buffer_fuzzy_find, {}) -- Fuzzy find inside current file

keymap.set('n', '<leader>lu', '<cmd>Telescope undo<cr>') -- Display undo-tree in telescope window
keymap.set('n', '<leader>u', '<cmd>Telescope undo<cr>') -- Display undo-tree in telescope window

local harpoon = require('harpoon')

require('harpoon'):setup()

keymap.set('n', '<leader>hm', function() harpoon:list():append() end)  -- Mark file in harpoon
keymap.set('n', '<leader>lm', '<cmd>Telescope harpoon marks<cr>')   -- List harpoon marks in telescope
keymap.set('n', '<leader>hl', function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
keymap.set('n', '<leader>hn', function() harpoon:list():next() end)
keymap.set('n', '<leader>hp', function() harpoon:list():prev() end)
