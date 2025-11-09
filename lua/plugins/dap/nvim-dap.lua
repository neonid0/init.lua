return {
    "mfussenegger/nvim-dap",
    dependencies = {
        {
            "rcarriga/nvim-dap-ui",
            config = function()
                local dapui = require("dapui")
                dapui.setup({
                    layouts = {
                        {
                            elements = {
                                { id = "scopes", size = 0.35 },
                                { id = "breakpoints", size = 0.15 },
                                { id = "stacks", size = 0.15 },
                                { id = "watches", size = 0.35 },
                            },
                            size = 40,
                            position = "left",
                        },
                        {
                            elements = {
                                { id = "repl", size = 0.6 },
                                { id = "console", size = 0.4 },
                            },
                            size = 10,
                            position = "bottom",
                        },
                    },
                    -- Other settings you can tweak
                    floating = {
                        max_height = nil,
                        max_width = nil,
                        border = "rounded",
                    },
                    render = {
                        max_width = {
                            scopes = 60,
                        },
                    },
                })
            end,
        },
    },
    config = function()
        local dap = require("dap")
        local dapui = require("dapui")

        -- Open/close the DAP UI automatically
        dap.listeners.after.event_initialized["dapui_config"] = function()
            dapui.open()
        end
        dap.listeners.before.event_terminated["dapui_config"] = function()
            dapui.close()
        end
        dap.listeners.before.event_exited["dapui_config"] = function()
            dapui.close()
        end

        -- Essential Keymaps
        vim.keymap.set("n", "<leader>dc", function()
            dap.continue()
        end, { desc = "[D]AP [C]ontinue" })
        vim.keymap.set("n", "<leader>dj", function()
            dap.step_over()
        end, { desc = "[D]AP Step [J]ver (Over)" })
        vim.keymap.set("n", "<leader>dk", function()
            dap.step_into()
        end, { desc = "[D]AP Step [K]nto (Into)" })
        vim.keymap.set("n", "<leader>do", function()
            dap.step_out()
        end, { desc = "[D]AP Step [O]ut" })
        vim.keymap.set("n", "<leader>db", function()
            dap.toggle_breakpoint()
        end, { desc = "[D]AP Toggle [B]reakpoint" })
        vim.keymap.set("n", "<leader>dB", function()
            dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
        end, { desc = "[D]AP Set [B]reakpoint with Condition" })

        -- UI and REPL Keymaps
        vim.keymap.set("n", "<leader>du", function()
            dapui.toggle()
        end, { desc = "[D]AP Toggle [U]I" })
        vim.keymap.set("n", "<leader>dr", function()
            dap.repl.open()
        end, { desc = "[D]AP Open [R]EPL" })

        -- Launch/Terminate
        vim.keymap.set("n", "<leader>dl", function()
            require("dap.ext.vscode").load_launchjs()
        end, { desc = "[D]AP [L]aunch from launch.json" })
        vim.keymap.set("n", "<leader>dt", function()
            dap.terminate()
        end, { desc = "[D]AP [T]erminate" })
    end,
}
