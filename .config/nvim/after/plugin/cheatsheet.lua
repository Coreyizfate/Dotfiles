require("cheatsheet").setup({
    bundled_cheatsheets = true,
    bundled_plugin_cheatsheets = true,
    include_only_installed_plugins = true,
    telescope_mappings = {
        ['<CR>'] = require('cheatsheet.telescope.actions').select_or_fill_commandline,
        ['<C-CR>'] = require('cheatsheet.telescope.actions').select_or_execute,
        ['<C-c>'] = require('cheatsheet.telescope.actions').copy_cheat_value,
        ['<C-e>'] = require('cheatsheet.telescope.actions').edit_user_cheatsheet,
    }
})

vim.keymap.set('n', '<leader>?', ':Cheatsheet<CR>')
vim.keymap.set('n', '<leader>cs', ':Cheatsheet<CR>')
vim.keymap.set('n', '<leader>ce', ':CheatsheetEdit')
