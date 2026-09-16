require("config.keys")
require("config.lazy")

-- Color theme
vim.cmd.colorscheme "tokyonight-night"

-- Tabs
require("config.tabs").config { width = 2 }

-- Line numbers
vim.opt.relativenumber = true
vim.opt.number = true
