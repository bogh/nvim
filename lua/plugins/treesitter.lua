return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      indent = {
        disable = {
          "ts",
          "tsx",
          "json",
          "jsonc",
          "yaml",
          "yml",
        },
      },
    },
  },
}
