return {
	"nvim-treesitter/nvim-treesitter",

	dependencies = {
		"windwp/nvim-ts-autotag",
		"windwp/nvim-autopairs",
	},

	build = ":TSUpdate",
	event = "bufWinEnter",

	config = function()
		local treesitter = require("nvim-treesitter.configs")
		treesitter.setup({
			ensure_installed = {
				"c",
				"cpp",
				"lua",
				"vim",
				"vimdoc",
				"html",
				"css",
				"java",
				"javascript",
				"typescript",
				"python",
				"markdown",
				"markdown_inline",
                "dockerfile",
			},
			sync_install = false,
			auto_install = true,
			highlight = {
				enable = true,
                -- disable = {},
                disable = function(lang, buf)
                    local max_filesize = 100 * 1024 -- 100 KB
                    local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
                    if ok and stats and stats.size > max_filesize then
                        return true
                    end
                end,
				additional_vim_regex_highlighting = false,
			},
			autotag = {
			    enable = true,
			},
			autopairs = {
			    enable = true,
			},
			-- rainbow = {
			--	enable = true,
			-- },
			-- context_commentstring = {
			-- 	enable = true,
			-- 	enable_autocmd = false,
			-- },
		})
	end,
}
