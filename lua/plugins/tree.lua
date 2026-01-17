return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    config = function()
        require("nvim-tree").setup {
            renderer = {
                icons = {
                    show = {
                        file = false,
                        folder = false,
                        folder_arrow = false,
                        git = true,
                        modified = false,
                    }
                }
            }
        }
    end,
}
