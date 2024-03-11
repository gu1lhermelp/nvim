return {
	"jose-elias-alvarez/null-ls.nvim",
	-- dependencies = {
	-- 	"jay-babu/mason-null-ls.nvim",
	-- },
	config = function()
		local null_ls = require("null-ls")
		local formatting = null_ls.builtins.formatting
        -- local diagnostics = null_ls.builtin.diagnostics
		local sources = {
            formatting.clang_format,
			formatting.stylua,
            formatting.black,
            formatting.cmake_format,
		}
		null_ls.setup({
			sources = sources,
		})
	end,
}
