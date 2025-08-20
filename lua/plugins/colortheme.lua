return {
  {
    "projekt0n/github-nvim-theme",
    name = "github-theme",
    enabled = false,
    config = function()
      require("github-theme").setup({
        -- ...
      })

      vim.cmd("colorscheme github_dark_dimmed")
    end,
  },
  {
    "catppuccin/nvim",
    enabled = false,
    lazy = false,
    name = "catppuccin",
    priority = 1000,
  },
  {
    "rose-pine/neovim",
    enabled = false,
    name = "rose-pine",
    config = function()
      vim.cmd("colorscheme rose-pine")
    end,
  },
  {
    "sainnhe/gruvbox-material",
    enabled = false,
    lazy = false,
    config = function()
      vim.o.background = "dark"
      vim.g.gruvbox_material_background = "medium" -- soft | medium | hard
      -- Optionally configure and load the colorscheme
      -- directly inside the plugin declaration.
      vim.g.gruvbox_material_enable_italic = true
      vim.cmd.colorscheme("gruvbox-material")
    end,
  },
  {
    "sainnhe/everforest",
    enabled = false,
    lazy = false,
    config = function()
      vim.g.everforest_background = "hard" -- soft | medium | hard
      vim.g.everforest_enable_italic = 1
      vim.g.everforest_disable_italic_comment = 1
      vim.g.everforest_better_performance = 1

      -- Apply the colorscheme
      vim.cmd.colorscheme("everforest")

      -- Additional highlight override
      vim.api.nvim_set_hl(0, "Normal", { bg = "#1e2326" }) -- Custom background
      vim.api.nvim_set_hl(0, "NormalNC", { bg = "#1e2326" })
    end,
  },
  {
    "sainnhe/sonokai",
    enabled = false,
    lazy = false,
    config = function()
      -- vim.o.background = "dark"
      vim.g.gruvbox_material_background = "medium" -- soft | medium | hard
      -- Optionally configure and load the colorscheme
      -- directly inside the plugin declaration.
      vim.g.sonokai_enable_italic = true
      vim.cmd.colorscheme("sonokai")
    end,
  },
  {
    "sainnhe/edge",
    enabled = false,
    lazy = false,
    config = function()
      -- vim.o.background = "dark"
      vim.g.gruvbox_material_background = "hard" -- soft | medium | hard
      -- Optionally configure and load the colorscheme
      -- directly inside the plugin declaration.
      vim.g.edge_enable_italic = true
      vim.cmd.colorscheme("edge")
    end,
  },
  {
    "folke/tokyonight.nvim",
    enabled = true,
    lazy = false,
  },
}
