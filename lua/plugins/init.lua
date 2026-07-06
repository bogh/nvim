require("dap-python").setup("uv")

return {

  {
    "LazyVim/LazyVim",

    opts = {
      colorscheme = "bamboo",
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
            name = "colorful",
            providers = {
              { name = "usages", enabled = true, highlight = "Function" },
              { name = "last_author", enabled = true, highlight = "String" },
            },
            style = {
              highlight = "Comment", -- fallback for providers without a highlight
            },
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
  {
    "danitrap/version-lens.nvim",
    config = true,
  },
}
