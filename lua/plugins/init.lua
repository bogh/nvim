require("dap-python").setup("uv")

return {

  { "rebelot/kanagawa.nvim", name = "kanagawa", lazy = false, priority = 1000 },
  { "jacoborus/tender.vim", name = "tender", lazy = false, priority = 1000 },
  { "bluz71/vim-moonfly-colors", name = "moonfly", lazy = false, priority = 1000 },
  { "bluz71/vim-nightfly-colors", name = "nightfly", lazy = false, priority = 1000 },
  {
    "LazyVim/LazyVim",

    opts = {
      colorscheme = "nightfly",
    },
  },
  {
    "oribarilan/lensline.nvim",
    branch = "release/2.x",
    event = "LspAttach",
    config = function()
      require("lensline").setup({
        profiles = {
          {
            name = "basic",
            providers = {
              { name = "usages", enabled = true, include = { "refs" }, breakdown = false },
              { name = "last_author", enabled = true },
            },
            style = { render = "all", placement = "above" },
          },
          {
            name = "informative",
            providers = {
              { name = "usages", enabled = true, include = { "refs", "defs", "impls" }, breakdown = true },
              { name = "diagnostics", enabled = true, min_level = "HINT" },
              { name = "complexity", enabled = true },
            },
            style = { render = "focused", placement = "inline" },
          },
        },
      })
    end,
  },
  {
    "folke/snacks.nvim",
    opts = {
      picker = {
        sources = {
          explorer = {
            -- auto_close = true,
            jump = {
              close = true,
            },
          },
        },
      },
      scroll = { enabled = false },
    },
  },

  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = false },
    },
  },
  {
    "danitrap/version-lens.nvim",
    config = true,
  },
}
