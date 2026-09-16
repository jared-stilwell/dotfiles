return {{
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    bufdelete = { enabled = true },
    dim = { enabled = false }, -- need to ensure LSP support is better before using this
    explorer = { enabled = true },
    indent = {
      priority = 1,
      enabled = true,
      only_scope = false,
      only_current = true,
    },
    picker = { enabled = true },
    quickfile = { enabled = true },
    scroll = { enabled = true },
    win = { enabled = true },
    zen = { enabled = true },
  },
  keys = {
     -- explorer
    { "<leader>x", function() Snacks.explorer.open() end, desc = "Open Explorer" },
    { "<leader>X", function() Snacks.explorer.reveal() end, desc = "Toggle Explorer (current file)" },
    -- git
    { "<leader>gg", function() Snacks.picker.git_log() end, desc = "Git log" },
    { "<leader>gl", function() Snacks.picker.git_log_line() end, desc = "Git log for selected lines" },
    { "<leader>gs", function() Snacks.picker.git_status() end, desc = "Git status" },
    -- gh
    { "<leader>gp", function() Snacks.picker.gh_pr() end, desc = "GitHub Pull Requests (open)" },
    { "<leader>gP", function() Snacks.picker.gh_pr({ state = "all" }) end, desc = "GitHub Pull Requests (all)" },
    -- zen
    { "<leader>z", function() Snacks.zen.zen() end, desc = "Zen mode" },
  }
}}
