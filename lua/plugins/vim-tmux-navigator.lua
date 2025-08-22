return {
  {
    "christoomey/vim-tmux-navigator",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
      "TmuxNavigatorProcessList",
    },
    init = function()
      -- don't create the default <C-h/j/k/l> mappings
      vim.g.tmux_navigator_no_mappings = 1
    end,
    keys = {
      -- { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
      -- { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
      -- { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
      -- { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
      -- { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },

      { "<M-h>", "<cmd>TmuxNavigateLeft<cr>" },
      { "<M-j>", "<cmd>TmuxNavigateDown<cr>" },
      { "<M-k>", "<cmd>TmuxNavigateUp<cr>" },
      { "<M-l>", "<cmd>TmuxNavigateRight<cr>" },
      { "<M-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },

      -- -- Normal-mode Alt navigation (works inside Neovim; crosses into tmux at edges)
      -- { "<M-h>", "<Cmd><C-U>TmuxNavigateLeft<CR>", mode = "n", desc = "Window left" },
      -- { "<M-j>", "<Cmd><C-U>TmuxNavigateDown<CR>", mode = "n", desc = "Window down" },
      -- { "<M-k>", "<Cmd><C-U>TmuxNavigateUp<CR>", mode = "n", desc = "Window up" },
      -- { "<M-l>", "<Cmd><C-U>TmuxNavigateRight<CR>", mode = "n", desc = "Window right" },
      --
      -- (Optional) Alt nav from terminal-mode splits
      { "<M-h>", [[<C-\><C-n><Cmd>TmuxNavigateLeft<CR>]], mode = "t", desc = "Window left" },
      { "<M-j>", [[<C-\><C-n><Cmd>TmuxNavigateDown<CR>]], mode = "t", desc = "Window down" },
      { "<M-k>", [[<C-\><C-n><Cmd>TmuxNavigateUp<CR>]], mode = "t", desc = "Window up" },
      { "<M-l>", [[<C-\><C-n><Cmd>TmuxNavigateRight<CR>]], mode = "t", desc = "Window right" },
    },
  },
}
