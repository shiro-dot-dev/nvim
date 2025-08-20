return {
  {
    "folke/zen-mode.nvim",
    opts = {
      window = {
        width = 120, -- テキストエリアの幅
        options = {
          -- signcolumn = "no", -- disable signcolumn
          number = true, -- disable number column
          relativenumber = true, -- disable relative numbers
          -- cursorline = false, -- disable cursorline
          -- cursorcolumn = false, -- disable cursor column
          -- foldcolumn = "0", -- disable fold column
          -- list = false, -- disable whitespace characters -- signcolumn = "no",
        },
      },
      plugins = {
        tmux = { enabled = true },
      },
    },
    keys = {
      { "<leader>z", "<cmd>ZenMode<CR>", desc = "Toggle Zen Mode" },
    },
  },
}
