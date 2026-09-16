print("loaded lsp.lua")

return {{
  "neovim/nvim-lspconfig",
  dependencies = {
    "mason-org/mason.nvim",
    "mason-org/mason-lspconfig.nvim",
  },
  opts = {
    ensure_installed = {
      "lua_ls",
      "laravel_ls",
      "tailwindcss",
    }
  },
  config = function()
    require("mason").setup()
    require("mason-lspconfig").setup()

    -- Set config for the Lua language server
    -- so it knows not to flag globals
    vim.lsp.config("lua_ls", {
      settings = {
        Lua = {
          runtime = { version = 'LuaJIT' },
          diagnostics ={
            globals = { "vim", "require" },
          },
          workspace = {
            -- Make the server aware of Neovim runtime files
            library = vim.api.nvim_get_runtime_file("", true),
          },
          telemetry = { enable = false }
        },
      }
    })
  end
}}
