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
