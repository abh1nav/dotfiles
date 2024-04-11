local plugins = {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "black",
        "goimports-reviser",
        "golines",
        "gopls",
        "lua-language-server",
        "html-lsp",
        "mypy",
        "pyright",
        "rust-analyzer",
        "ruff",
        "stylua",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "cmake",
        "csv",
        "dockerfile",
        "git_config",
        "gitignore",
        "go",
        "gomod",
        "gosum",
        "html",
        "http",
        "javascript",
        "json",
        "make",
        "markdown",
        "markdown_inline",
        "proto",
        "python",
        "scss",
        "ssh_config",
        "svelte",
        "terraform",
        "toml",
        "tsv",
        "typescript",
        "vim",
        "yaml",
      }
    }
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    ft = "go",
    opts = function()
      return require "custom.configs.null-ls"
    end,
  },
  {
    "olexsmir/gopher.nvim",
    ft = "go",
    config = function(_, opts)
      require("gopher").setup(opts)
    end,
    build = function ()
      vim.cmd [[silent! GoInstallDeps]]
    end,
  },
  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function()
      vim.g.rustfmt_autosave = 1
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    opts = function ()
      local M = require("plugins.configs.cmp")
      table.insert(M.sources, {name = "crates"})
      return M
    end
  },
  {
    "saecki/crates.nvim",
    dependencies = "hrsh7th/nvim-cmp",
    ft = {"rust", "toml"},
    config = function(_, opts)
      local crates = require("crates")
      crates.setup(opts)
      crates.show()
    end,
  },
  {
    "alexghergh/nvim-tmux-navigation",
    config = function()
      require("nvim-tmux-navigation").setup({})
      vim.keymap.set("n", "<C-h>", "<Cmd>NvimTmuxNavigateLeft<CR>", {})
      vim.keymap.set("n", "<C-j>", "<Cmd>NvimTmuxNavigateDown<CR>", {})
      vim.keymap.set("n", "<C-k>", "<Cmd>NvimTmuxNavigateUp<CR>", {})
      vim.keymap.set("n", "<C-l>", "<Cmd>NvimTmuxNavigateRight<CR>", {})
    end,
  },
  {
    "L3MON4D3/LuaSnip",
	  -- follow latest release.
	  version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
	  -- install jsregexp (optional!).
	  build = "make install_jsregexp"
  },
}

return plugins
