return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = { "caddy" },
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
