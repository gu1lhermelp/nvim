vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use "nvim-lua/popup.nvim"
    use "nvim-lua/plenary.nvim"
    use "numToStr/Comment.nvim"
    use "nvim-lualine/lualine.nvim"
    use "akinsho/toggleterm.nvim"
    use "windwp/nvim-autopairs"
    use "windwp/nvim-ts-autotag"

    -- Colorscheme
    use "Mofiqul/dracula.nvim"

    -- Completion
    use "hrsh7th/nvim-cmp"
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/cmp-path"
    use "hrsh7th/cmp-cmdline"
    use 'saadparwaiz1/cmp_luasnip'
    use "hrsh7th/cmp-nvim-lsp"

    -- Snippets
    use "L3MON4D3/LuaSnip"
    use "rafamadriz/friendly-snippets"

    -- LSP
    use "neovim/nvim-lspconfig"
    use "jose-elias-alvarez/null-ls.nvim"
    
    -- Telescope
    use "nvim-telescope/telescope.nvim"

    -- Treesitter
    use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate",}
 
    -- Nvim-tree
    use "kyazdani42/nvim-tree.lua"
    use "kyazdani42/nvim-web-devicons"

    
end)
