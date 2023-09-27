return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
--  dependencies = {
--    "nvim-tree/nvim-web-devicons",
--  },
    -- keys = {
    --     { "<leader>e", ":NvimTreeToggle<cr>" },
    --     { "<leader>/", ":NvimTreeFindFile<cr>" },
    -- },
    config = function()
        require("nvim-tree").setup {
            renderer = {
                icons = {
                    show = {
                        file = false,
                        folder = false,
                        folder_arrow = false,
                        git = false,
                        modified = false,
                    }
                }
            }
        }
    end,
}
