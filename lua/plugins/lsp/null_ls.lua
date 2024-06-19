return {
	"jose-elias-alvarez/null-ls.nvim",
	-- dependencies = {
	-- 	"jay-babu/mason-null-ls.nvim",
	-- },
	config = function()
		local null_ls = require("null-ls")
		local formatting = null_ls.builtins.formatting
        local diagnostics = null_ls.builtins.diagnostics

        diagnostics.shellcheck.with({ filetypes = {"sh", "bats" } })
        formatting.shfmt.with({ filetypes = {"sh", "bats" } })

		local sources = {
            formatting.clang_format,
			formatting.stylua,
            formatting.black,
            formatting.cmake_format,
            formatting.shfmt,
            diagnostics.shellcheck,
		}
		null_ls.setup({
			sources = sources,
		})
	end,
}
