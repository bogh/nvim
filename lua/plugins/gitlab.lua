-- require("gitlab").setup({
--   log_path = vim.fn.stdpath("cache") .. "/gitlab.nvim.log",
--
--   debug = {
--     request = true, -- Neovim -> Go server
--     response = true, -- Go server -> Neovim
--     gitlab_request = true, -- Go server -> GitLab
--     gitlab_response = true, -- GitLab -> Go server
--   },
-- })

return {
  {
    "harrisoncramer/gitlab.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "dlyongemallo/diffview-plus.nvim", -- Maintained fork of "sindrets/diffview.nvim".
      "stevearc/dressing.nvim", -- Recommended but not required. Better UI for pickers.
      "nvim-tree/nvim-web-devicons", -- Recommended but not required. Icons in discussion tree.
    },
    build = function()
      require("gitlab.server").build(true)
    end, -- Builds the Go binary
    config = function()
      require("gitlab").setup({
        log_path = vim.fn.stdpath("cache") .. "/gitlab.nvim.log",

        debug = {
          request = true, -- Neovim -> Go server
          response = true, -- Go server -> Neovim
          gitlab_request = true, -- Go server -> GitLab
          gitlab_response = true, -- GitLab -> Go server
        },
      })
    end,
  },
}
