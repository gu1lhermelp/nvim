return {

	"folke/which-key.nvim",
	config = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 500

		local wk = require("which-key")

		-- Keymaps prependded with leader
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

            p = { "<cmd>lua vim.lsp.buf.format()<cr>", "Format" },

            w = {
				name = "Miscellaneous",
                d = {"<cmd>lua print(vim.fn.getcwd())<cr>", "Print CWD"},
            },

            v = {
                name = "Git",
                v = { "<cmd>Neogit kind=vsplit<cr>", "Neogit" },
            },

            d = {
                name = "Diffview",
                o = { "<cmd>DiffviewOpen --selected-file=%<cr>", "Open diff against current index" },
                h = { "<cmd>DiffviewFileHistory %<cr>", "Open current file history" },
                c = { "<cmd>DiffviewClose<cr>", "Close diffview" },
            },

            g = {
                s = { ":lua require('gitlab').summary()<cr>" , "Open MR summary." },
                r = { ":lua require('gitlab').review()<cr>" , "Start MR review." },
                td = { ":lua require('gitlab').toggle_discussions()<cr>" , "Toggle discussions panel."},
                d = { ":lua require('gitlab').toggle_draft_mode()<cr>" , "Toggle between draft and live mode."},
                pd = { ":lua require('gitlab').publish_all_drafts()<cr>" , "Publishes all unpublished draft notes."},
                c = { ":lua require('gitlab').create_comment()<cr>" , "Create comment on the current line."},
                mc = { ":lua require('gitlab').create_multiline_comment()<cr>" , "Create multi-line comment."},
                cs = { ":lua require('gitlab').comment_suggestion()<cr>" , "Create a comment suggestion."},
                n = { ":lua require('gitlab').create_note()<cr>" , "Add general comment not related to code." },
            },

        }

		local opts = { prefix = "<leader>" }
		wk.register(mappings, opts)

		mappings = {
			-- Lsp Stuffs
			g = {
				name = "LSP",
				-- i = { ":LspInfo<cr>", "Connected Language Servers" },
				k = { "<cmd>lua vim.lsp.buf.hover()<cr>", "Hover Commands" },
				K = { "<cmd>lua vim.lsp.buf.signature_help()<cr>", "Signature Help" },
				w = { "<cmd>lua vim.lsp.buf.add_workspace_folder()<cr>", "Add Workspace Folder" },
				W = { "<cmd>lua vim.lsp.buf.remove_workspace_folder()<cr>", "Remove Workspace Folder" },
				-- l = {
				-- 	"<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<cr>",
				-- 	"List Workspace Folders",
				-- },
                l = { "<cmd>lua vim.diagnostic.open_float()<cr>", "Open float"},
                N = { "<cmd>lua vim.diagnostic.goto_prev()<cr>", "Open float"},
                n = { "<cmd>lua vim.diagnostic.goto_next()<cr>", "Open float"},
				t = { "<cmd>lua vim.lsp.buf.type_definition()<cr>", "Type Definition" },
				d = { "<cmd>lua vim.lsp.buf.definition()<cr>", "Go To Definition" },
				D = { "<cmd>lua vim.lsp.buf.declaration()<cr>", "Go To Declaration" },
				r = { "<cmd>lua vim.lsp.buf.references()<cr>", "References" },
				R = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
				o = { "<cmd>lua vim.lsp.buf.outgoing_calls()<cr>", "Outgoing Calls" },
				i = { "<cmd>lua vim.lsp.buf.incoming_calls()<cr>", "Incoming Calls" },
				a = { "<cmd>lua vim.lsp.buf.code_action({apply = true})<cr>", "Code Action" },
				A = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
				-- e = { "<cmd>Lspsaga show_line_diagnostics<cr>", "Show Line Diagnostics" },
				f = { "<cmd>lua vim.lsp.buf.format()<cr>", "Format" },
			},

            -- ["<F2>"] = {"<cmd>DapToggleBreakpoint<cr>", "DAP Toggle Breakpoint"},
            -- ["<F5>"] = {"<cmd>DapContinue<cr>", "DAP Continue"},
            ["<F2>"] = {"<cmd>LspInfo<cr>", "LSP Info"},
            ["<F3>"] = {"<cmd>LspStart<cr>", "LSP Start"},
            ["<F5>"] = {"<cmd>LspRestart<cr>", "LSP Restart"},
            ["<F6>"] = {"<cmd>DapStepOver<cr>", "DAP Step Over"},
            ["<F7>"] = {"<cmd>DapStepInto<cr>", "DAP Step Into"},
            ["<F8>"] = {"<cmd>DapStepOut<cr>", "DAP Step Out"},
            ["<F9>"] = {"<cmd>DapTerminate<cr>", "DAP Terminate"},
            ["<F10>"] = {"<cmd>DapRestartFrame<cr>", "DAP Restart"},
            ["<F12>"] = {"<cmd>DapLoadLaunchJSON<cr>", "DAP Load Json"},
        }

		wk.register(mappings)
	end,
}
