return {
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
      require("bufferline").setup {
        options = {
          diagnostics = "nvim_lsp",
          separator_style = "slope",
          offsets = {
            filetype = "NvimTree",
            text_align = "left",
            separator = true,
            text = "Files",
          },
        },
      }
    end,
  },
  {
    "roobert/bufferline-cycle-windowless.nvim",
    dependencies = {
      { "akinsho/bufferline.nvim" },
    },
    config = function()
      require("bufferline-cycle-windowless").setup {
        -- whether to start in enabled or disabled mode
        default_enabled = true,
      }
    end,
  },
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local harpoon = require "harpoon"
      -- REQUIRED
      harpoon:setup()
      -- REQUIRED
      --
      vim.keymap.set("n", "<leader>a", function()
        harpoon:list():add()
      end, { desc = "[A]dd buffer to Harpoon2" })
      vim.keymap.set("n", "<C-e>", function()
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end, { desc = "Toggle harpoon2 quick menu" })
      -- Toggle previous & next buffers stored within Harpoon list
      vim.keymap.set("n", "<C-S-P>", function()
        harpoon:list():prev()
      end, { desc = "Harpoon2 [P]revious in list" })
      vim.keymap.set("n", "<C-S-N>", function()
        harpoon:list():next()
      end, { desc = "Harpoon2 [N]ext in list" })
    end,
  },
}
