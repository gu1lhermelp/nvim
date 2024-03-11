local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true}

-- Remap space as leader key
keymap("n", "<Space>", "", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

keymap("n", "<leader>s", ":split<cr>", opts)
keymap("n", "<leader>v", ":vsplit<cr>", opts)

keymap("n", "<leader>r", ":set relativenumber<cr>", opts)
keymap("n", "<leader>n", ":set norelativenumber<cr>", opts)

keymap("n", "<leader>h", ":ClangdSwitchSourceHeader<cr>", opts)

-- Visual
keymap("v", "p", '"_dP', opts)
