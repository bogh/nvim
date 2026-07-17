-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<leader>fo", function()
  local file = vim.api.nvim_buf_get_name(0)

  if file ~= "" then
    vim.ui.open(file)
  end
end, { desc = "Open file externally" })
