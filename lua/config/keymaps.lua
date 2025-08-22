-- For conciseness
local opts = { noremap = true, silent = true }

-- Disable the spacebar key's default behavior in Normal and Visual modes
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- vim.api.nvim_set_keymap("n", "<Space>", "", { noremap = true, silent = true })

-- show netrw
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

--visual block mode
-- vim.keymap.set("n", "<C-m>", "<C-v>", opts)

-- escape insert mode
vim.keymap.set({ "i", "v", "n" }, "<C-C>", "<ESC>", { desc = "Exit insert mode with <C-i>" })

-- Cursor operation in INSERT mode (MacOS like)
vim.keymap.set("i", "<C-f>", "<Right>", opts)
vim.keymap.set("i", "<C-b>", "<Left>", opts)
vim.keymap.set("i", "<C-d>", "<Del>", opts)
vim.keymap.set("i", "<C-h>", "<BS>", opts)

-- save file
-- vim.keymap.set("n", "<C-l>", "<cmd> w <CR>", opts)

-- save file without auto-formatting
vim.keymap.set("n", "<leader>sn", "<cmd>noautocmd w <CR>", opts)

-- quit file
-- vim.keymap.set("n", "<C-q>", "<cmd> q <CR>", opts)

-- delete single character without copying into register
vim.keymap.set("n", "x", '"_x', opts)

-- Vertical scroll and center
vim.keymap.set("n", "<C-d>", "<C-d>zz", opts)
vim.keymap.set("n", "<C-u>", "<C-u>zz", opts)

-- Find and center
vim.keymap.set("n", "n", "nzzzv", opts)
vim.keymap.set("n", "N", "Nzzzv", opts)

-- Resize with arrows
vim.keymap.set("n", "<Up>", ":resize -2<CR>", opts)
vim.keymap.set("n", "<Down>", ":resize +2<CR>", opts)
vim.keymap.set("n", "<Left>", ":vertical resize -2<CR>", opts)
vim.keymap.set("n", "<Right>", ":vertical resize +2<CR>", opts)

-- Buffers
vim.keymap.set("n", "<Tab>", ":bnext<CR>", opts)
vim.keymap.set("n", "<S-Tab>", ":bprevious<CR>", opts)
vim.keymap.set("n", "<leader>x", ":bdelete!<CR>", opts) -- close buffer
vim.keymap.set("n", "<leader>b", "<cmd> enew <CR>", opts) -- new buffer

-- Window management
vim.keymap.set("n", "<leader>v", "<C-w>v", { desc = "split window vertically", noremap = true, silent = true }) -- split window vertically
vim.keymap.set("n", "<leader>h", "<C-w>s", { desc = "split window horizontally", noremap = true, silent = true }) -- split window horizontally
vim.keymap.set("n", "<leader>se", "<C-w>=", opts) -- make split windows equal width & height
vim.keymap.set("n", "<leader>xs", ":close<CR>", opts) -- close current split window

-- Navigate between splits
-- vim.keymap.set("n", "<C-k>", ":wincmd k<CR>", opts)
-- vim.keymap.set("n", "<C-j>", ":wincmd j<CR>", opts)
-- vim.keymap.set("n", "<C-h>", ":wincmd h<CR>", opts)
-- vim.keymap.set("n", "<C-l>", ":wincmd l<CR>", opts)

-- Tabs
vim.keymap.set("n", "<leader>to", ":tabnew<CR>", opts) -- open new tab
vim.keymap.set("n", "<leader>tx", ":tabclose<CR>", opts) -- close current tab
vim.keymap.set("n", "<leader>tn", ":tabn<CR>", opts) --  go to next tab
vim.keymap.set("n", "<leader>tp", ":tabp<CR>", opts) --  go to previous tab

-- Toggle line wrapping
vim.keymap.set("n", "<leader>lw", "<cmd>set wrap!<CR>", opts)

-- Diagnostic keymaps
-- vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "go to previous diagnostic message" })
-- vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })

-- Stay in indent mode
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

-- Keep last yanked when pasting
-- vim.keymap.set("x", "p", '"_dP', opts)
vim.keymap.set("x", "<leader>p", [["_dP]])

-- Macro from 'primeagen'
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- increment/decrement
vim.keymap.set("n", "+", "<C-a>", { desc = "Increment numbers", noremap = true })
vim.keymap.set("n", "_", "<C-x>", { desc = "Decrement numbers", noremap = true })
vim.keymap.set("n", "<C-a>", "+")
vim.keymap.set("n", "<C-x>", "_")

-- swap key ; and : for command mode
-- vim.keymap.set("n", ";", ":")
-- vim.keymap.set("n", ":", ";")

-- undotree
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

-- remove LazyVim's Ctrl window maps
local del = vim.keymap.del
for _, mode in ipairs({ "n", "t" }) do
  pcall(del, mode, "<C-h>")
  pcall(del, mode, "<C-j>")
  pcall(del, mode, "<C-k>")
  pcall(del, mode, "<C-l>")
end
