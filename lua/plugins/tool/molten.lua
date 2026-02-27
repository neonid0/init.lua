return {
    "benlubas/molten-nvim",
    version = "^1.0.0",
    dependencies = { "3rd/image.nvim" },
    build = ":UpdateRemotePlugins",
    init = function()
        -- Set configuration before plugin loads
        vim.g.molten_image_provider = "image.nvim"
        vim.g.molten_output_win_max_height = 20
        vim.g.molten_auto_open_output = true
        vim.g.molten_wrap_output = true
        vim.g.molten_virt_text_output = true
        vim.g.molten_virt_lines_off_by_1 = true
    end,
    config = function()
        -- Keymaps for molten
        vim.keymap.set("n", "<leader>mi", ":MoltenInit<CR>", { desc = "Initialize Molten", silent = true })
        vim.keymap.set("n", "<leader>ml", ":MoltenEvaluateLine<CR>", { desc = "Evaluate line", silent = true })
        vim.keymap.set("v", "<leader>mv", ":<C-u>MoltenEvaluateVisual<CR>gv", { desc = "Evaluate visual selection", silent = true })
        vim.keymap.set("n", "<leader>mr", ":MoltenReevaluateCell<CR>", { desc = "Re-evaluate cell", silent = true })
        vim.keymap.set("n", "<leader>md", ":MoltenDelete<CR>", { desc = "Delete Molten cell", silent = true })
        vim.keymap.set("n", "<leader>mo", ":MoltenHideOutput<CR>", { desc = "Hide output", silent = true })
        vim.keymap.set("n", "<leader>ms", ":MoltenShowOutput<CR>", { desc = "Show output", silent = true })

        -- Run code cell (finds cell by # %% markers)
        vim.keymap.set("n", "<leader>mc", function()
            -- Save cursor position
            local save_cursor = vim.fn.getcurpos()

            -- Search backward for cell start
            vim.fn.search("^# %%", "bc")
            local start_line = vim.fn.line(".")

            -- Move to line after marker
            vim.cmd("normal! j")

            -- Search forward for next cell or end of file
            if vim.fn.search("^# %%", "W") > 0 then
                -- Found next cell, go to line before it
                vim.cmd("normal! k")
            else
                -- No next cell, go to end of file
                vim.cmd("normal! G")
            end

            local end_line = vim.fn.line(".")

            -- Select the range visually and evaluate
            vim.cmd(string.format("normal! %dGV%dG", start_line + 1, end_line))
            vim.cmd("MoltenEvaluateVisual")

            -- Restore cursor position
            vim.fn.setpos(".", save_cursor)
        end, { desc = "Evaluate code cell", silent = true })

        -- Enter output window
        vim.keymap.set("n", "<leader>me", ":noautocmd MoltenEnterOutput<CR>", { desc = "Enter output window", silent = true })
    end,
}
