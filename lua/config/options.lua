-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
-- vim.opt.relativenumber = false
-- vim.opt.background = "light"
vim.g.lazyvim_picker = "fzf"
-- vim.opt.foldlevelstart = 0

vim.filetype.add({
  filename = { Caddyfile = "caddy" },
  extension = { caddy = "caddy", caddyfile = "caddy" },
  pattern = { [".*/Caddyfile%..+"] = "caddy" },
})
