local status_ok, autotags = pcall(require, "nvim-ts-autotag")
if not status_ok then
    return
end

autotags.setup({})


