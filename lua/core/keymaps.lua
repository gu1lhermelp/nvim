local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true}

-- Remap space as leader key
keymap("n", "<Space>", "", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

