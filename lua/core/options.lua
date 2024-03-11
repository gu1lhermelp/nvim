-- Appearance
vim.opt.termguicolors = true
vim.o.number = true

-- Files
vim.o.fileencoding = "utf-8"
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Split windows
vim.o.splitbelow = true
vim.o.splitright = true

-- Clipbaord
vim.o.clipboard = "unnamedplus"

-- Search
vim.o.hlsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true

-- Mouse and Scrolling
vim.o.mouse = "a"

-- Tabs and indentations
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

-- Other
vim.o.undofile = true

-- Treesitter folding
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldenable = false

vim.cmd[[colorscheme kanagawa-wave]]
