local options = {
    clipboard = "unnamedplus",
    hlsearch = true,
    ignorecase = true,
    mouse = "a",
    undofile = true,
    expandtab = true,
    shiftwidth = 4,
    tabstop = 4,
    -- cursorline = true
    number = true,
    splitbelow = true,
    splitright = true,
    termguicolors = true,
}

for k, v in pairs(options) do
    vim.opt[k] = v
end

-- Dracula
vim.cmd[[colorscheme dracula]]

