--keymapping
vim.g.maplocalleader = " "
vim.g.mapleader = " "
vim.opt.shell = "zsh"

-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- load config/ui.
require("config.highlights")

-- LSP setup
-- require("mason").setup()
-- require("mason-lspconfig").setup()
require("mason").setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗",
    },
  },
})
require("mason-lspconfig").setup()
-- ensure_installed = {
--   "html",
--   "lua_ls",
--   "pyright",
--   "gopls",
--   "tsserver",
--   "eslint",
--   "tailwindcss",
--   "jsonls",
-- },

-- Automatically setup LSP servers installed by Mason
-- Added cmp configs
-- local lspconfig = require("lspconfig")
-- local capabilities = require("cmp_nvim_lsp").default_capabilities()
-- require("mason-lspconfig").setup_handlers({
--   -- Default handler (called for all installed servers)
--   function(server_name)
--     lspconfig[server_name].setup({
--       -- capabilities = capabilities,
--     })
--   end,
-- })
