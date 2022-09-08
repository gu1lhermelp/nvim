local null_ls_status_ok, null_ls = require(pcall, "null-ls")
if not null_ls_status_ok then
    return
end

local formatting = null_ls.builtin.formatting
local diagnostics = null_ls.builtin.diagnostics

null_ls.setup({
    debug = false,
    sources = {
        formatting.clang_format,
        diagnostics.cppcheck,
    }
})
