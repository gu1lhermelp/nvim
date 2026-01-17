return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
        -- "hrsh7th/cmp-nvim-lsp",
		"saghen/blink.cmp",
	},
	config = function()
		local lspconfig = require("lspconfig")
		-- local cmp_nvim_lsp = require("cmp_nvim_lsp")
		-- local capabilities = cmp_nvim_lsp.default_capabilities()
        local capabilities = require('blink.cmp').get_lsp_capabilities()
        lspconfig.clangd.setup({
            capabilities=capabilities,
        })
        -- lspconfig.pylsp.setup({
        --     capabilities=capabilities,
        -- })
        lspconfig.pyright.setup({
            capabilities=capabilities,
        })
        lspconfig.ruff.setup({
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
