return {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim' },
    -- keys = {
    --     { "<leader>ff", "<cmd>Telescope find_files<cr>" },
    --     { "<leader>ft", "<cmd>Telescope live_grep<cr>" },
    --     { "<leader>fs", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>" },
    --     { "<leader>fb", "<cmd>Telescope buffers<cr>" },
    --     { "<leader>fh", "<cmd>Telescope help_tags<cr>" },
    -- },
    config = function()
        require("telescope").setup {}
    end,
}
