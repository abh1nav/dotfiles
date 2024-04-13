require "nvchad.options"

local o = vim.o

o.cursorlineo = "both" -- to enable cursorline!
o.colorcolumn = "80"

-- Numbers
o.number = true
o.relativenumber = true

-- Folding
o.foldlevel = 20
o.foldmethod = "indent"
o.foldexpr = "nvim_treesitter#foldexpr()"
