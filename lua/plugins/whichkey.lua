return {

    "folke/which-key.nvim",
    config = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 500

        local wk = require("which-key")

        -- Keymaps prependded with leader
        wk.add({
            { "g",  group = "LSP" },
            { "gk", "<cmd>lua vim.lsp.buf.hover()<cr>", desc = "Hover Commands" },
            { "gK", "<cmd>lua vim.lsp.buf.signature_help()<cr>",            desc = "Signature Help" },
            { "gw", "<cmd>lua vim.lsp.buf.add_workspace_folder()<cr>",      desc = "Add Workspace Folder" },
            { "gW", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<cr>",   desc = "Remove Workspace Folder" },
            { "gl", "<cmd>lua vim.diagnostic.open_float()<cr>",             desc = "Open float" },
            { "gN", "<cmd>lua vim.diagnostic.goto_prev()<cr>",              desc = "Open float" },
            { "gn", "<cmd>lua vim.diagnostic.goto_next()<cr>",              desc = "Open float" },
            { "gt", "<cmd>lua vim.lsp.buf.type_definition()<cr>",           desc = "Type Definition" },
            { "gd", "<cmd>lua vim.lsp.buf.definition()<cr>",                desc = "Go To Definition" },
            { "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>",               desc = "Go To Declaration" },
            { "gr", "<cmd>lua vim.lsp.buf.references()<cr>",                desc = "References" },
            { "gR", "<cmd>lua vim.lsp.buf.rename()<cr>",                    desc = "Rename" },
            { "go", "<cmd>lua vim.lsp.buf.outgoing_calls()<cr>",            desc = "Outgoing Calls" },
            { "gi", "<cmd>lua vim.lsp.buf.incoming_calls()<cr>",            desc = "Incoming Calls" },
            { "ga", "<cmd>lua vim.lsp.buf.code_action({apply = true})<cr>", desc = "Code Action" },
            { "gA", "<cmd>lua vim.lsp.buf.code_action()<cr>",               desc = "Code Action" },
            { "gf", "<cmd>lua vim.lsp.buf.format()<cr>",                    desc = "Format" },
            { "<F2>", "<cmd>LspInfo<cr>", desc = "LSP Info" },
            { "<F3>", "<cmd>LspStart<cr>", desc = "LSP Start" },
            { "<F5>", "<cmd>LspRestart<cr>", desc = "LSP Restart" },
            { "<F6>", "<cmd>DapStepOver<cr>", desc = "DAP Step Over" },
            { "<F7>", "<cmd>DapStepInto<cr>", desc = "DAP Step Into" },
            { "<F8>", "<cmd>DapStepOut<cr>", desc = "DAP Step Out" },
            { "<F9>", "<cmd>DapTerminate<cr>", desc = "DAP Terminate" },
            { "<F10>", "<cmd>DapRestartFrame<cr>", desc = "DAP Restart" },
            { "<F12>", "<cmd>DapLoadLaunchJSON<cr>", desc = "DAP Load Json" },
            { "<leader>p", "<cmd>lua vim.lsp.buf.format()<cr>", desc = "Format" },
            { "<leader>wd", "<cmd>lua print(vim.fn.getcwd())<cr>", desc = "Print CWD" },
            { "<leader>e",  group = "NvimTree" },
            { "<leader>ee", ":NvimTreeToggle<cr>", desc = "NvimTreeToggle" },
            { "<leader>ef", ":NvimTreeFindFile<cr>", desc = "NvimTreeFindFile" },
            { "<leader>f",  group = "Telescope" },
            { "<leader>ff", ":Telescope find_files<cr>", desc = "Telescope find_files" },
            { "<leader>ft", ":Telescope live_grep<cr>", desc = "Telescope live_grep" },
            { "<leader>fs", ":Telescope lsp_dynamic_workspace_symbols<cr>", desc = "Telescope lsp_dynamic_workspace_symbols" },
            { "<leader>fb", ":Telescope buffers<cr>", desc = "Telescope buffers" },
            { "<leader>fc", ":Telescope current_buffer_fuzzy_find theme=ivy<cr>", desc = "Fuzzy Find in File" },
            { "<leader>fo", ":Telescope oldfiles theme=ivy<cr>", desc = "Telescope oldfiles" },
            { "<leader>p", "<cmd>lua vim.lsp.buf.format()<cr>", desc = "Format" },
            { "<leader>v",  group = "Neogit" },
            { "<leader>vv", "<cmd>Neogit kind=vsplit<cr>", desc = "Neogit" },
            { "<leader>d",  group = "Diffview" },
            { "<leader>do", "<cmd>DiffviewOpen --selected-file=%<cr>", desc = "Open diff against current index" },
            { "<leader>dh", "<cmd>DiffviewFileHistory %<cr>", desc = "Open current file history" },
            { "<leader>dc", "<cmd>DiffviewClose<cr>", desc = "Close diffview" },

            -- g = {
            --     s = { ":lua require('gitlab').summary()<cr>", "Open MR summary." },
            --     r = { ":lua require('gitlab').review()<cr>", "Start MR review." },
            --     td = { ":lua require('gitlab').toggle_discussions()<cr>", "Toggle discussions panel." },
            --     d = { ":lua require('gitlab').toggle_draft_mode()<cr>", "Toggle between draft and live mode." },
            --     pd = { ":lua require('gitlab').publish_all_drafts()<cr>", "Publishes all unpublished draft notes." },
            --     c = { ":lua require('gitlab').create_comment()<cr>", "Create comment on the current line." },
            --     mc = { ":lua require('gitlab').create_multiline_comment()<cr>", "Create multi-line comment." },
            --     cs = { ":lua require('gitlab').comment_suggestion()<cr>", "Create a comment suggestion." },
            --     n = { ":lua require('gitlab').create_note()<cr>", "Add general comment not related to code." },
            -- },
        })
    end,
}
