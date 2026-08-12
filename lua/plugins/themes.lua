return {
  {
    "LazyVim/LazyVim",

    opts = {
      -- colorscheme = "gruvbox",
      -- colorscheme = "PaperColor",
      -- colorscheme = "south",
      -- colorscheme = "gruvbox",
      -- colorscheme = "oxocarbon",
      -- colorscheme = "cendre",
      colorscheme = "tokyonight",
    },
    -- config = function()
    --   vim.opt.background = "light"
    -- end,
  },
  {
    "Aejkatappaja/cendre",
    lazy = false,
    priority = 1000,
    config = function()
      require("cendre").setup({
        background = "hard", -- "hard" | "medium" | "soft"
        -- italic = false,
      })
    end,
  },
  { "rebelot/kanagawa.nvim", name = "kanagawa", lazy = false, priority = 1000 },
  { "jacoborus/tender.vim", name = "tender", lazy = false, priority = 1000 },
  { "bluz71/vim-moonfly-colors", name = "moonfly", lazy = false, priority = 1000 },
  { "bluz71/vim-nightfly-colors", name = "nightfly", lazy = false, priority = 1000 },
  { "vague-theme/vague.nvim", name = "vague", lazy = false, priority = 1000 },
  { "olimorris/onedarkpro.nvim", name = "onedarkpro", lazy = false, priority = 1000 },
  { "ribru17/bamboo.nvim", name = "bamboo", lazy = false, priority = 1000 },
  {
    "arnauKL/south.nvim",
    lazy = false,
    priority = 1000,
  },
  { "morhetz/gruvbox", name = "gruvbox", lazy = false, priority = 1000 },
  { "dracula/vim", name = "dracula", lazy = false, priority = 1000 },
  { "NLKNguyen/papercolor-theme", name = "papercolor", lazy = false, priority = 1000 },
  {
    "loctvl842/monokai-pro.nvim",
    lazy = false,
    priority = 1000,
  },
  -- {
  --   "nyoom-engineering/oxocarbon.nvim",
  --   lazy = false,
  --   priority = 1000,
  -- },
}
