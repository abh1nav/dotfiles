return {
  {
    "williamboman/mason.nvim",
    event = "VimEnter",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    event = "VimEnter",
    dependencies = {
      "williamboman/mason.nvim",
    },
    config = function()
      require("mason-lspconfig").setup {
        ensure_installed = require "configs.mason-packages",
      }
    end,
  },
  {
    "neovim/nvim-lspconfig",
    event = "VimEnter",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      require "configs.lsp-setup"
    end,
  },
}
