-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim to that mapping are correct.
-- This is also a good place to setup other settings (vim.opt)

-- Aliases & Utilities
local autocmd = vim.api.nvim_create_autocmd
local keymap = vim.keymap.set
local CommandGroup = vim.api.nvim_create_augroup('juniper.config', { clear = false })

-- Leader
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Close the current window
keymap("n", "<leader>q", function() vim.cmd("close") end)

-- Split the current window 
keymap("n", "<leader>|", function() vim.cmd("vsplit") end)
keymap("n", "<leader>-", function() vim.cmd("split") end)

-- Line Moves
keymap("n", "<tab>", "0v$") -- highlight current line
keymap("v", "K", ":m '>-2<CR>gv=gv")
keymap("v", "J", ":m '>+1<CR>gv=gv")

-- LSP-specific keymaps
autocmd("LspAttach", {
  group = CommandGroup,
  callback = function(ev)
    local opts = { buffer = ev.buf }
    keymap("n", "gd", function() vim.lsp.buf.definition() end, opts)
    keymap("n", "H", function() vim.lsp.buf.hover() end, opts)
    keymap("n", "<leader>vd", function() vim.diagnostic.open_float { focusable = false } end, opts)
    keymap("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
    keymap("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
    keymap("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
    keymap("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)

    -- No clue what these do yet
    -- keymap("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
  end
})
