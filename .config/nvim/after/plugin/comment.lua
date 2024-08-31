local api = require('Comment.api')
local config = require('Comment.config'):get()

-- vim.g.skip_ts_context_commentstring_module = true

require('ts_context_commentstring').setup({
  enable_autocmd = false,
})

require("Comment").setup({
  pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
  toggler = {
    line = 'gcc',
    block = 'gcb',
  },
  opleader = {
    line = 'gc',
    block = 'gb',
  },
  extra = {
    above = 'gcO',
    below = 'gco',
    eol = 'gce',
  },
  mappings = {
    basic = true,
    extra = true,
  },
})

vim.keymap.set('n', '<leader>cl', api.toggle.linewise.current)
-- vim.keymap.set('n', 'gcc', api.toggle.linewise.current)
vim.keymap.set('n', '<leader>cb', api.toggle.blockwise.current)
-- vim.keymap.set('n', 'gcb', api.toggle.blockwise.current)

vim.keymap.set('n', '<leader>cn', api.call('toggle.linewise', 'g@'), { expr = true })
-- vim.keymap.set('n', 'gc', api.call('toggle.linewise', 'g@'), { expr = true})

vim.keymap.set('x', '<leader>cl', function()
  vim.api.nvim_feedkeys(esc, 'nx', false)
  api.toggle.linewise(vim.fn.visualmode())
end)

