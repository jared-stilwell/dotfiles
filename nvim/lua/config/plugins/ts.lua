return {{
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  build = ':TSUpdate',
  config = function()
    require'nvim-treesitter.config'.setup {
      install_dir = vim.fn.stdpath('data') .. '/site',
      ensure_installed = {
        "c", "lua", "vim", "vimdoc", "query", 
        "php", "markdown", "javascript", "blade",
      },
      auto_install = false,
      highlight = {
        enable = true,

      },
    }
  end
}}
