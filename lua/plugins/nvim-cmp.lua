return {
  -- nvim-cmpのコアプラグイン
  {
    "hrsh7th/nvim-cmp",
    enabled = true,
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
    },
    -- opts = function()
    --   vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })
    --   local cmp = require("cmp")
    --   local defaults = require("cmp.config.default")()
    --   local auto_select = true
    --   return {
    --     auto_brackets = {}, -- configure any filetype to auto add brackets
    --     -- completion = {
    --     --   completeopt = "menu,menuone,noinsert" .. (auto_select and "" or ",noselect"),
    --     -- },
    --     preselect = auto_select and cmp.PreselectMode.Item or cmp.PreselectMode.None,
    --     mapping = cmp.mapping.preset.insert({
    --       ["<C-b>"] = cmp.mapping.scroll_docs(-4),
    --       ["<C-f>"] = cmp.mapping.scroll_docs(4),
    --       ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
    --       ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
    --       ["<C-Space>"] = cmp.mapping.complete(),
    --       ["<CR>"] = LazyVim.cmp.confirm({ select = auto_select }),
    --       ["<C-y>"] = LazyVim.cmp.confirm({ select = true }),
    --       ["<S-CR>"] = LazyVim.cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    --       ["<C-CR>"] = function(fallback)
    --         cmp.abort()
    --         fallback()
    --       end,
    --       ["<tab>"] = function(fallback)
    --         return LazyVim.cmp.map({ "snippet_forward", "ai_accept" }, fallback)()
    --       end,
    --     }),
    --     sources = cmp.config.sources({
    --       { name = "lazydev" },
    --       { name = "nvim_lsp" },
    --       { name = "path" },
    --     }, {
    --       { name = "buffer" },
    --     }),
    --     formatting = {
    --       format = function(entry, item)
    --         local icons = LazyVim.config.icons.kinds
    --         if icons[item.kind] then
    --           item.kind = icons[item.kind] .. item.kind
    --         end
    --
    --         local widths = {
    --           abbr = vim.g.cmp_widths and vim.g.cmp_widths.abbr or 40,
    --           menu = vim.g.cmp_widths and vim.g.cmp_widths.menu or 30,
    --         }
    --
    --         for key, width in pairs(widths) do
    --           if item[key] and vim.fn.strdisplaywidth(item[key]) > width then
    --             item[key] = vim.fn.strcharpart(item[key], 0, width - 1) .. "…"
    --           end
    --         end
    --
    --         return item
    --       end,
    --     },
    --     experimental = {
    --       -- only show ghost text when we show ai completions
    --       ghost_text = vim.g.ai_cmp and {
    --         hl_group = "CmpGhostText",
    --       } or false,
    --     },
    --     sorting = defaults.sorting,
    --   }
    -- end,
    -- -----------------------------------------------------------------------
    config = function()
      -- Set up nvim-cmp.
      local cmp = require("cmp")
      local cmp_autopairs = require("nvim-autopairs.completion.cmp")

      cmp.setup({
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
          end,
        },
        window = {
          -- completion = cmp.config.window.bordered(),
          -- documentation = cmp.config.window.bordered(),
          completion = {
            -- border = "rounded",
            winhighlight = "Normal:Pmenu,FloatBorder:PmenuBorder,CursorLine:PmenuSel,Search:None",
          },
          documentation = {
            border = "rounded",
            winhighlight = "Normal:CmpDoc,FloatBorder:CmpDocBorder",
          },
        },

        -- preselect = cmp.PreselectMode.None,

        --[[ mapping = {
             ["<CR>"] = cmp.mapping(function(fallback)
               if cmp.visible() then
                 cmp.confirm({ select = true })
               else
                 fallback()
               end
             end, { "i", "s" }),
           }, ]]

        mapping = cmp.mapping.preset.insert({
          ["<Up>"] = cmp.mapping.scroll_docs(-4),
          ["<Down>"] = cmp.mapping.scroll_docs(4),
          ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
          ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<C-y>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
          ["<CR>"] = cmp.mapping(function(fallback)
            fallback()
          end, { "i", "s" }),
        }),
        -- completion = {
        --   completeopt = "menu,menuone,noinsert",
        -- },
        sources = cmp.config.sources({
          { name = "nvim_lsp", max_item_count = 30 },
          { name = "luasnip" }, -- For luasnip users.
        }, {
          { name = "buffer", max_item_count = 10 },
        }),
      })

      -- To use git you need to install the plugin petertriho/cmp-git and uncomment lines below
      -- Set configuration for specific filetype.
      --[[ cmp.setup.filetype('gitcommit', {
       sources = cmp.config.sources({
         { name = 'git' },
       }, {
         { name = 'buffer' },
       })
    })
    require("cmp_git").setup() ]]

      cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

      -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline({ "/", "?" }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = "buffer" },
        },
      })

      -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = "path" },
        }, {
          { name = "cmdline" },
        }),
        matching = { disallow_symbol_nonprefix_matching = false },
      })

      --[[ -- Set up lspconfig.
         local capabilities = require("cmp_nvim_lsp").default_capabilities()
         -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
         require("lspconfig")["<YOUR_LSP_SERVER>"].setup({
           capabilities = capabilities,
         }) ]]
    end,
  },
}
