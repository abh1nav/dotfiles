local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local util = require "lspconfig/util"

-- LSP Keymaps
vim.keymap.set("n", "<leader>lh", vim.lsp.buf.hover, { desc = "[L]SP [H]over" })
vim.keymap.set("n", "<leader>lca", vim.lsp.buf.code_action, { desc = "[L]SP [C]ode [A]ction" })

-- LSP Server config
lspconfig.gopls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "gopls" },
  filetypes = { "go", "gomod", "gotmpl", "gosum", "gowork" },
  root_dir = util.root_pattern("go.mod", ".git"),
  settings = {
    gopls = {
      completeUnimported = true,
      usePlaceholders = true,
      analyses = {
        fieldalignment = true,
        nilness = true,
        shadow = true,
        unusedparams = true,
        unusedvariable = true,
      },
    },
  },
}

lspconfig.pyright.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "python" },
}

lspconfig.lua_ls.setup {}

lspconfig.tsserver.setup {}
