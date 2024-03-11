return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"neovim/nvim-lspconfig",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",
	},
	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")
		cmp.setup({
			snippet = {
				-- REQUIRED - you must specify a snippet engine
				expand = function(args)
					luasnip.lsp_expand(args.body) -- For `luasnip` users.
				end,
			},
			window = {
				-- completion = cmp.config.window.bordered(),
				-- documentation = cmp.config.window.bordered(),
			},
			mapping = cmp.mapping.preset.insert({
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-e>"] = cmp.mapping.abort(),
				["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
			}),
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "luasnip" }, -- For luasnip users.
				{ name = "path" },
				{ name = "buffer" },
			}),
			formatting = {
				fields = { "abbr", "menu", "kind" },
				format = function(entry, item)
					-- Define menu shorthand for different completion sources.
					local menu_icon = {
						nvim_lsp = "LSP",
						nvim_lua = "LUA",
						luasnip = "Snippet",
						buffer = "Buffer",
						path = "Path",
					}
					-- Set the menu "icon" to the shorthand for each completion source.
					item.menu = menu_icon[entry.source.name]

					-- Set the fixed width of the completion menu to 60 characters.
					fixed_width = 60

					-- Set 'fixed_width' to false if not provided.
					fixed_width = fixed_width or false

					-- Get the completion entry text shown in the completion window.
					local content = item.abbr

					-- Set the fixed completion window width.
					if fixed_width then
						vim.o.pumwidth = fixed_width
					end

					-- Get the width of the current window.
					local win_width = vim.api.nvim_win_get_width(0)

					-- Set the max content width based on either: 'fixed_width'
					-- or a percentage of the window width, in this case 20%.
					-- We subtract 10 from 'fixed_width' to leave room for 'kind' fields.
					local max_content_width = fixed_width and fixed_width - 10 or math.floor(win_width * 0.2)

					-- Truncate the completion entry text if it's longer than the
					-- max content width. We subtract 3 from the max content width
					-- to account for the "..." that will be appended to it.
					if #content > max_content_width then
						item.abbr = vim.fn.strcharpart(content, 0, max_content_width - 3) .. "..."
					else
						item.abbr = content .. (" "):rep(max_content_width - #content)
					end
					return item
				end,
			},
		})

		-- Set configuration for specific filetype.
		cmp.setup.filetype("gitcommit", {
			sources = cmp.config.sources({
				{ name = "git" }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
			}, {
				{ name = "buffer" },
			}),
		})

		-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
		cmp.setup.cmdline({ "/", "?" }, {
			mapping = cmp.mapping.preset.cmdline(),
			sources = {
				{ name = "buffer" },
			},
		})

		-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
		cmp.setup.cmdline(":", {
			mapping = cmp.mapping.preset.cmdline(),
			sources = cmp.config.sources({
				{ name = "path" },
			}, {
				{ name = "cmdline" },
			}),
		})

		-- Set up lspconfig.
		-- local capabilities = require('cmp_nvim_lsp').default_capabilities()
		-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
		-- require('lspconfig')['<YOUR_LSP_SERVER>'].setup {
		--   capabilities = capabilities
		-- }
	end,
}
