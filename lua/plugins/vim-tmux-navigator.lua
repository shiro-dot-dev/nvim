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
    keys = {
      -- { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
      -- { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
      -- { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
      -- { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
      -- { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
      { "<M-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
      { "<M-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
      { "<M-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
      { "<M-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
      { "<M-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
    },
  },
}
