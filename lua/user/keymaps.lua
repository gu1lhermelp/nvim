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
keymap("n", "<leader>/", ":NvimTreeFindFile<cr>", opts)

keymap("n", "<leader>ff", "<cmd>Telescope find_files<cr>", opts)
keymap("n", "<leader>fs", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", opts)
keymap("n", "<leader>ft", "<cmd>Telescope live_grep<cr>", opts)

keymap("n", "<leader>p", ":lua vim.lsp.buf.format()<cr>", opts)

keymap("n", "<leader>b", ":BufferLinePick<cr>", opts)
keymap("n", "<leader>c", ":BufferLinePickClose<cr>", opts)
keymap("n", "<c-left>", ":BufferLineCyclePrev<cr>", opts)
keymap("n", "<c-right>", ":BufferLineCycleNext<cr>", opts)

keymap("n", "<leader>,", ":BufferLineCloseLeft<cr>", opts)
keymap("n", "<leader>.", ":BufferLineCloseRight<cr>", opts)

keymap("n", "<leader>s", ":split<cr>", opts)
keymap("n", "<leader>v", ":vsplit<cr>", opts)

keymap("n", "<leader>r", ":set relativenumber<cr>", opts)
keymap("n", "<leader>n", ":set norelativenumber<cr>", opts)

keymap("n", "<leader>h", ":ClangdSwitchSourceHeader<cr>", opts)

function toogleRelativeLineNumber()
    if vim.opt.relativenumber == false then
        vim.opt.relativenumber = true
    else
        vim.opt.relativenumber = false
    end
end

-- Visual
keymap("v", "p", '"_dP', opts)
