local vim = vim
local opt = vim.opt

opt.colorcolumn = "80"

-- Folding
opt.foldlevel = 20
opt.foldmethod = "indent"
opt.foldexpr = "nvim_treesitter#foldexpr()"

