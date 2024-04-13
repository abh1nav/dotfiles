-- Telescope is already installed by NvChad.
return {
  "nvim-telescope/telescope-ui-select.nvim",
  lazy = false,
  config = function()
    require("telescope").setup {
      defaults = {
        prompt_prefix = "  ",
      },
      extensions = {
        ["ui-select"] = {
          require("telescope.themes").get_dropdown {},
          require("telescope.themes").get_cursor {},
        },
      },
    }
    require("telescope").load_extension "ui-select"
  end,
}
