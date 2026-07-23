return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        biome = {
          keys = {
            {
              "<leader>cB",
              function()
                vim.lsp.buf.code_action({
                  apply = true,
                  context = {
                    only = { "source.fixAll.biome" },
                    diagnostics = {},
                  },
                })
              end,
              desc = "Fix all Biome diagnostics",
            },
          },
        },
      },
    },
  },
}
