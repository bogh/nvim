require("dap-python").setup("uv")

return {

  { "rebelot/kanagawa.nvim", name = "kanagawa", lazy = false, priority = 1000 },
  { "jacoborus/tender.vim", name = "tender", lazy = false, priority = 1000 },
  { "bluz71/vim-moonfly-colors", name = "moonfly", lazy = false, priority = 1000 },
  { "bluz71/vim-nightfly-colors", name = "nightfly", lazy = false, priority = 1000 },
  {
    "LazyVim/LazyVim",

    opts = {
      colorscheme = "tender",
    },
  },
  {
    "folke/snacks.nvim",
    opts = {
      picker = {
        sources = {
          explorer = {
            auto_close = true,
            -- jump = {
            --   close = true,
            -- },
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
}
