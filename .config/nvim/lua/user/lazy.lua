local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
      "git",
      "clone",
      "--filter=blob:none",
      "https://github.com/folke/lazy.nvim.git",
      "--branch=stable", -- latest stable release
      lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    -- lsp
    {
      "VonHeikemen/lsp-zero.nvim",
      dependencies = {
        -- LSP Support
        { "neovim/nvim-lspconfig" },
        { "williamboman/mason.nvim" },
        { "williamboman/mason-lspconfig.nvim" },
        { "jay-babu/mason-nvim-dap.nvim" },

        -- null-ls
        { "nvimtools/none-ls.nvim" },
        { "jay-babu/mason-null-ls.nvim" },

        -- Autocompletion
        { "hrsh7th/nvim-cmp" },
        { "hrsh7th/cmp-buffer" },
        { "hrsh7th/cmp-path" },
        { "saadparwaiz1/cmp_luasnip" },
        { "hrsh7th/cmp-nvim-lsp" },
        { "hrsh7th/cmp-nvim-lua" },
        { "hrsh7th/nvim-dansa" },    -- Indent according to surroundings

        -- Snippets
        { "L3MON4D3/LuaSnip", version = "2.*" },
        { "honza/vim-snippets" },
      },
    },

    -- nice to have
    { "folke/which-key.nvim" },
    { "numToStr/Comment.nvim" },
    { "windwp/nvim-autopairs" },
    { "windwp/nvim-ts-autotag" },
    { "JoosepAlviste/nvim-ts-context-commentstring" },
    { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
    { "nvim-treesitter/nvim-treesitter-context" },
    { "sudormrfbin/cheatsheet.nvim",
      dependencies = {
        {'nvim-telescope/telescope.nvim'},
        {'nvim-lua/popup.nvim'},
        {'nvim-lua/plenary.nvim'},
    }},

    -- navigation
    {
      "kyazdani42/nvim-tree.lua",
      version = "*",
      lazy = false,
      dependencies = { { "nvim-tree/nvim-web-devicons" } },
    },
    { "simrat39/symbols-outline.nvim" },

    -- Debugging
    { "mfussenegger/nvim-dap" },
    { "rcarriga/nvim-dap-ui" },
    { "theHamsta/nvim-dap-virtual-text" },
    { "folke/trouble.nvim" },

    -- Telescope
    { "ThePrimeagen/harpoon", branch = "harpoon2" },
    { "nvim-telescope/telescope.nvim" },
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    { "debugloop/telescope-undo.nvim" },
    { "nvim-telescope/telescope-dap.nvim" },

    -- misc
    { "mbbill/undotree" },
    { "uga-rosa/ccc.nvim" },
    { "nvim-pack/nvim-spectre" },

    -- looks
    {
      "folke/noice.nvim",    -- Popup
      dependencies = { { "MunifTanjim/nui.nvim" }, { "rcarriga/nvim-notify" }, { "nvim-lua/plenary.nvim" } },
    },
    { "nvim-lualine/lualine.nvim" },
    { "folke/tokyonight.nvim" },
})
