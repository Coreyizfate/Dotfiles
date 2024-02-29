
require('trouble').setup({
	position = 'bottom',
	height = 10,
	icons = true,
	mode = 'document_diagnostics',
	group = true,
	cycle_results = true,
	action_keys = { 		-- key mappings for actions in the trouble list
        -- map to {} to remove a mapping, for example:
        -- close = {},
        close = "q", -- close the list
        cancel = "<esc>", -- cancel the preview and get back to your last window / buffer / cursor
        refresh = "r", -- manually refresh
        jump = { "<cr>", "<tab>", "<2-leftmouse>" }, -- jump to the diagnostic or open / close folds
        open_split = { "<c-h>" }, -- open buffer in new split
        open_vsplit = { "<c-v>" }, -- open buffer in new vsplit
        open_tab = { "<c-t>" }, -- open buffer in new tab
        jump_close = {"o"}, -- jump to the diagnostic and close the list
        toggle_mode = "m", -- toggle between "workspace" and "document" diagnostics mode
        switch_severity = "s", -- switch "diagnostics" severity filter level to HINT / INFO / WARN / ERROR
        toggle_preview = "P", -- toggle auto_preview
        hover = "O", -- opens a small popup with the full multiline message
        preview = "p", -- preview the diagnostic location
        open_code_href = "c", -- if present, open a URI with more information about the diagnostic error
        close_folds = {"zM", "zm"}, -- close all folds
        open_folds = {"zR", "zr"}, -- open all folds
        toggle_fold = {"zA", "za"}, -- toggle fold of current file
        previous = "k", -- previous item
        next = "j", -- next item
        help = "?", -- help menu
    },
})

vim.keymap.set("n", "<leader>dt", function() require("trouble").toggle() end)
vim.keymap.set("n", "<leader>dw", function() require("trouble").toggle("workspace_diagnostics") end)
vim.keymap.set("n", "<leader>dd", function() require("trouble").toggle("document_diagnostics") end)
vim.keymap.set("n", "<leader>dq", function() require("trouble").toggle("quickfix") end)
vim.keymap.set("n", "<leader>dl", function() require("trouble").toggle("loclist") end)
vim.keymap.set("n", "gR", function() require("trouble").toggle("lsp_references") end)