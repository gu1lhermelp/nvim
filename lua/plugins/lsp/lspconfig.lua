return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
	},
	config = function()
		local lspconfig = require("lspconfig")
		local cmp_nvim_lsp = require("cmp_nvim_lsp")
		local capabilities = cmp_nvim_lsp.default_capabilities()
        lspconfig.clangd.setup({
            capabilities=capabilities,
        })
        lspconfig.pylsp.setup({
            capabilities=capabilities,
        })
        lspconfig.lua_ls.setup({
            capabilities=capabilities,
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { "vim" },
                    },
                },
            },
        })
        lspconfig.cmake.setup({
            capabilities=capabilities,
        })
        lspconfig.bashls.setup({
            capabilities=capabilities,
            filetypes={"sh", "bats"},
        })
    end,
}
