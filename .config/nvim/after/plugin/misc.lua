require("lualine").setup({
  sections = {
    lualine_x = {
      {
        require("noice").api.statusline.mode.get,
        cond = require("noice").api.statusline.mode.has,
        color = { fg = "#aaf7f0" },
      },
      "filetype",
    },
  },
})

require('nvim-treesitter.configs').setup({
  auto_install = true,
  highlight = {
    enable = true,
  },
})

require('nvim-ts-autotag').setup()
require('treesitter-context').setup({
  max_lines = 1,
})

require('nvim-autopairs').setup()
require('ccc').setup()

require('dansa').setup({
  default = {
    expandtab = true,
    space = { shiftwidth = 4 },
    tab = { shiftwidth = 4 },
  },
})
