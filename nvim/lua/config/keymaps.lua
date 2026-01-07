-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
--
-- This file is intentionally minimal because LazyVim provides comprehensive default keymaps.
-- LazyVim handles all the standard keymaps (navigation, LSP, git, etc.) out of the box.
-- Add any custom keymaps or overrides here if needed.

-- Quit Neovim with Control+Q
vim.keymap.set("n", "<C-q>", "<cmd>qa<cr>", { desc = "Quit all" })
vim.keymap.set("i", "<C-q>", "<esc><cmd>qa<cr>", { desc = "Quit all" })
