return {
  {
    "wsdjeg/iedit.nvim",
    event = "VeryLazy",
    config = function()
      require("iedit").setup()
      vim.keymap.set("n", "<leader>m", "<cmd>lua require('iedit').start()<cr>", { silent = true })
    end,
  },
}
