return {
  -- tailwind-tools.lua (https://github.com/luckasRanarison/tailwind-tools.nvim)
  -- Provides the following functionality:
  -- * tailwind auto complete for classes
  -- * preview of underlying css for tailwind classes
  -- * sets up the tailwind LSP (with nvim-lspconfig)
  -- * provides previews of colours inline
  "luckasRanarison/tailwind-tools.nvim",
  name = "tailwind-tools",
  build = ":UpdateRemotePlugins",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-telescope/telescope.nvim",
    "neovim/nvim-lspconfig",
  },
  opts = {},
}
