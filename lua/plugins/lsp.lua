return {
  -- How to install & uninstall LSP ↓
  --https://github.com/williamboman/mason-lspconfig.nvim?tab=readme-ov-file#commands
  -- You can see Lists of LSP installed with ":Mason" commands

  {
    "williamboman/mason.nvim",
    -- version = "^1.0.0",
  },
  {
    "williamboman/mason-lspconfig.nvim",
    -- version = "^1.0.0",
  },
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      -- list of LSP servers for mason to isntall automatically
      servers = {
        html = {},
        lua_ls = {},
        pyright = {},
        -- gopls = {},
        tsserver = {},
        eslint = {},
        tailwindcss = {},
        jsonls = {},
      },
    },
  },
}
