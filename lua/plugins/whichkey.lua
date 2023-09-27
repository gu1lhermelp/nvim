return {

	"folke/which-key.nvim",
	config = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300

		local wk = require("which-key")

		-- Keymaps
		local mappings = {
			-- NvimTree
			e = {
				name = "NvimTree",
				e = { ":NvimTreeToggle<cr>", "NvimTreeToggle" },
				f = { ":NvimTreeFindFile<cr>", "NvimTreeFindFile" },
			},

            -- Telescope
			f = {
				name = "Telescope",
				f = { ":Telescope find_files<cr>", "Telescope find_files" },
				t = { ":Telescope live_grep<cr>", "Telescope live_grep" },
				s = { ":Telescope lsp_dynamic_workspace_symbols<cr>", "Telescope lsp_dynamic_workspace_symbols" },
				b = { ":Telescope buffers<cr>", "Telescope buffers" },
				c = { ":Telescope current_buffer_fuzzy_find theme=ivy<cr>", "Fuzzy Find in File" },
				o = { ":Telescope oldfiles theme=ivy<cr>", "Telescope oldfiles" },
			},

			-- Lsp Stuffs
			g = {
				name = "LSP",
				i = { ":LspInfo<cr>", "Connected Language Servers" },
				k = { "<cmd>lua vim.lsp.buf.signature_help()<cr>", "Signature Help" },
				-- K = { "<cmd>Lspsaga hover_doc<cr>", "Hover Commands" },
				w = { "<cmd>lua vim.lsp.buf.add_workspace_folder()<cr>", "Add Workspace Folder" },
				W = { "<cmd>lua vim.lsp.buf.remove_workspace_folder()<cr>", "Remove Workspace Folder" },
				l = {
					"<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<cr>",
					"List Workspace Folders",
				},
				t = { "<cmd>lua vim.lsp.buf.type_definition()<cr>", "Type Definition" },
				d = { "<cmd>lua vim.lsp.buf.definition()<cr>", "Go To Definition" },
				D = { "<cmd>lua vim.lsp.buf.declaration()<cr>", "Go To Declaration" },
				r = { "<cmd>lua vim.lsp.buf.references()<cr>", "References" },
				-- R = { "<cmd>Lspsaga rename<cr>", "Rename" },
				-- a = { "<cmd>Lspsaga code_action<cr>", "Code Action" },
				-- e = { "<cmd>Lspsaga show_line_diagnostics<cr>", "Show Line Diagnostics" },
				-- n = { "<cmd>Lspsaga diagnostic_jump_next<cr>", "Go To Next Diagnostic" },
				-- N = { "<cmd>Lspsaga diagnostic_jump_prev<cr>", "Go To Previous Diagnostic" },
			},

        }

		local opts = { prefix = "<leader>" }
		wk.register(mappings, opts)
	end,
}
