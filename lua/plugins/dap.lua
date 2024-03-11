return {
    {
        "mfussenegger/nvim-dap",
        config = function()
            local dap = require("dap")
            local vscode = require("dap.ext.vscode")
            dap.adapters.cpp = {
                type = "executable",
                command = "/usr/bin/lldb-vscode-10",
                name = "lldb",
            }

            vscode.load_launchjs("launch.json", {})
        end,
    },
    {
        "rcarriga/nvim-dap-ui",
        dependencies = { "mfussenegger/nvim-dap" },
        config = function()
            local dap, dapui = require("dap"), require("dapui")
            dapui.setup()
            dap.listeners.after.event_initialized["dapui_config"] = function()
              dapui.open()
            end
            dap.listeners.before.event_terminated["dapui_config"] = function()
              dapui.close()
            end
            dap.listeners.before.event_exited["dapui_config"] = function()
              dapui.close()
            end
        end,
    },

}
