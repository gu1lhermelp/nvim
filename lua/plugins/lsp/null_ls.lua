return {
	-- "jose-elias-alvarez/null-ls.nvim",
	"nvimtools/none-ls.nvim",
	dependencies = {
        "gbprod/none-ls-shellcheck.nvim",
	},
	-- dependencies = {
	-- 	"jay-babu/mason-null-ls.nvim",
	-- },
	config = function()
		local null_ls = require("null-ls")
		local formatting = null_ls.builtins.formatting
        local diagnostics = null_ls.builtins.diagnostics

        -- diagnostics.shellcheck.with({ filetypes = {"sh", "bats" } })
        formatting.shfmt.with({ filetypes = {"sh", "bats" } })

		local sources = {
            formatting.clang_format,
            diagnostics.cppcheck,

            formatting.shfmt,
            -- diagnostics.shellcheck,
            require('none-ls-shellcheck.diagnostics'),
            require('none-ls-shellcheck.code_actions'),

            diagnostics.mypy,
            -- diagnostics.ruff,
            formatting.black,

            formatting.cmake_format,

			formatting.stylua,
		}
		null_ls.setup({
			sources = sources,
		})
	end,
}
