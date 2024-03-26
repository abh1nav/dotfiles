local vim = vim
local opt = vim.opt

opt.colorcolumn = "80"

-- Folding
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
