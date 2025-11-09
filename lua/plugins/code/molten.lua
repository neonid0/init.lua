return {
    "benlubas/molten-nvim",
    build = ":UpdateRemotePlugins", -- REQUIRED so commands get registered
    ft = { "python" }, -- load only for Python files
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        -- Tell Neovim which Python provider to use (replace with your uv python path!)
        vim.g.python3_host_prog = vim.fn.expand("~/Documents/projects/Fintech/projects/ai-analytics/.venv/bin/python")

        -- Image provider (for inline plots, use "kitty" or "wezterm")
        vim.g.molten_image_provider = "kitty"

        -- Optional: adjust output window
        vim.g.molten_output_win_max_height = 20
    end,
}
