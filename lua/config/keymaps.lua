-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

map("n", "<leader>fo", function()
  local file = vim.api.nvim_buf_get_name(0)

  if file ~= "" then
    vim.ui.open(file)
  end
end, { desc = "Open file externally" })

map("n", "<leader>ft", function()
  local file = vim.api.nvim_buf_get_name(0)
  local cwd = file ~= "" and vim.fs.dirname(file) or vim.fn.getcwd()

  Snacks.terminal.open(nil, { cwd = cwd })
end, { desc = "New Terminal in File Directory" })

local function highlight_search(text, whole_word)
  if not text or text == "" then
    return
  end

  -- Escape Vim regex characters and support multiline selections.
  text = vim.fn.escape(text, [[\]]):gsub("\n", [[\n]])

  local pattern = [[\V]] .. text
  if whole_word then
    pattern = [[\V\<]] .. text .. [[\>]]
  end

  vim.fn.setreg("/", pattern)
  vim.opt.hlsearch = true
  vim.v.hlsearch = 1
  vim.cmd.redraw()
end

-- Highlight every occurrence of the word under the cursor.
map("n", "<C-d>", function()
  highlight_search(vim.fn.expand("<cword>"), true)
end, { desc = "Highlight word under cursor" })

-- Highlight every occurrence of the visual selection.
map("x", "<C-d>", function()
  local selection = vim.fn.getregion(vim.fn.getpos("v"), vim.fn.getpos("."), { type = vim.fn.mode() })

  highlight_search(table.concat(selection, "\n"), false)
end, { desc = "Highlight visual selection" })

map("n", "<C-S-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
map("n", "<C-S-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
map("n", "<C-S-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
map("n", "<C-S-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })
