local opts = { noremap = true, silent = true}

local term_opts = { silent = true }

local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("n", "<Space>", "", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--  normal_mode = "n",
--  insert_mode = "i",
--  visual_mode = "v",
--  visual_block_mode = "x",
--  term_mode = "t",
--  command_mode = "c",

-- Normal
keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opts)

keymap("n", "<leader>f", "<cmd>Telescope find_files<cr>", opts)
keymap("n", "<c-t>", "<cmd>Telescope live_grep<cr>", opts)

keymap("n", "<leader>p", ":lua vim.lsp.buf.formatting_sync()<cr>", opts)

keymap("n", "<leader>b", ":BufferLinePick<cr>", opts)
keymap("n", "<leader>c", ":BufferLinePickClose<cr>", opts)
keymap("n", "<c-left>", ":BufferLineCyclePrev<cr>", opts)
keymap("n", "<c-right>", ":BufferLineCycleNext<cr>", opts)

-- Visual
keymap("v", "p", '"_dP', opts)
