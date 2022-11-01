local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
    return
end

nvim_tree.setup({
    disable_netrw = true,
    hijack_netrw = true,
    sort_by = "case_sensitive",
    view = {
        adaptive_size = false,
        width = 50,
        mappings = {
            list = {
                { key = "u", action = "dir_up" },
            },
        },
    },
    renderer = {
        group_empty = true,
    },
    filters = {
        dotfiles = true,
    },
})
