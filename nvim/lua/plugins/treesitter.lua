return { -- Highlight, edit, and navigate code
  "nvim-treesitter/nvim-treesitter",
  -- The `master` branch is frozen and does NOT support Neovim 0.12+ (it throws
  -- `attempt to call method 'range' (a nil value)` against 0.12's treesitter
  -- core). The `main` branch is a full, incompatible rewrite that targets
  -- Neovim 0.12+ and is where all future development happens.
  -- See `:help nvim-treesitter`.
  branch = "main",
  lazy = false, -- the main branch does not support lazy-loading
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter").setup()

    -- Parsers to keep installed. `markdown_inline` pairs with `markdown` for
    -- fenced-code-block highlighting.
    local ensure_installed = {
      "bash",
      "c",
      "html",
      "lua",
      "luadoc",
      "markdown",
      "markdown_inline",
      "vim",
      "vimdoc",
    }

    -- Install any listed parsers that are missing (a no-op if already present;
    -- runs asynchronously).
    do
      local installed = require("nvim-treesitter").get_installed()
      local missing = vim.tbl_filter(function(lang)
        return not vim.tbl_contains(installed, lang)
      end, ensure_installed)
      if #missing > 0 then
        require("nvim-treesitter").install(missing)
      end
    end

    -- The `main` branch ships no "modules": highlighting and indentation are
    -- Neovim features you turn on per buffer. We do it from a FileType autocmd,
    -- mirroring the old `highlight`, `indent`, and `auto_install` options.

    -- Languages that also want Vim's regex highlighting layered on top of
    -- treesitter (Ruby's indent rules depend on it). This was the old
    -- `additional_vim_regex_highlighting`.
    local vim_regex_highlight = { ruby = true }

    -- Languages to exclude from (experimental) treesitter indentation. This was
    -- the old `indent.disable`.
    local no_ts_indent = { ruby = true }

    local function attach(buf, lang)
      -- Highlighting is provided by Neovim core.
      pcall(vim.treesitter.start, buf, lang)
      if vim_regex_highlight[lang] then
        vim.bo[buf].syntax = "on"
      end
      if not no_ts_indent[lang] then
        vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end
    end

    local function enable_for_buf(buf)
      local lang = vim.treesitter.language.get_lang(vim.bo[buf].filetype)
      if not lang then
        return
      end

      local nt = require("nvim-treesitter")
      if vim.tbl_contains(nt.get_installed(), lang) then
        attach(buf, lang)
      elseif vim.tbl_contains(nt.get_available(), lang) then
        -- `auto_install = true`: fetch the parser, then highlight once ready.
        nt.install(lang):await(vim.schedule_wrap(function(err)
          if not err and vim.api.nvim_buf_is_valid(buf) then
            attach(buf, lang)
          end
        end))
      end
    end

    vim.api.nvim_create_autocmd("FileType", {
      group = vim.api.nvim_create_augroup("user_nvim_treesitter", { clear = true }),
      callback = function(args)
        enable_for_buf(args.buf)
      end,
    })

    -- Buffers already loaded before this config ran (e.g. `nvim file.lua`).
    for _, buf in ipairs(vim.api.nvim_list_bufs()) do
      if vim.api.nvim_buf_is_loaded(buf) then
        enable_for_buf(buf)
      end
    end
  end,
}
