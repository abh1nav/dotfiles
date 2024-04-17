-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- nvim-tree
vim.keymap.set("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", { desc = "Nvimtree Toggle window" })
vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeFocus<CR>", { desc = "Nvimtree Focus window" })

-- buffer management
vim.keymap.set("n", "<leader>x", "<cmd>bdelete<CR>", { desc = "[B]uffer [X]Close", noremap = true })
vim.keymap.set(
  "n",
  "<S-l>",
  "<CMD>BufferLineCycleWindowlessNext<CR>",
  { desc = "Buffer next", noremap = true, silent = true }
)
vim.keymap.set(
  "n",
  "<S-h>",
  "<CMD>BufferLineCycleWindowlessPrev<CR>",
  { desc = "Buffer previous", noremap = true, silent = true }
)
vim.keymap.set(
  "n",
  "<S-t>",
  "<CMD>BufferLineCycleWindowlessToggle<CR>",
  { desc = "Toggle bufferline-cycle-windowless", noremap = true, silent = true }
)
