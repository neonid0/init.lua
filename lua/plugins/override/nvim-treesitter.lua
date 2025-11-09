return {
    -- this is a "dummy" plugin spec just to hook into config
    "nvim-treesitter/nvim-treesitter",
    init = function()
        vim.api.nvim_create_autocmd("BufReadPre", {
            callback = function(args)
                local ok, stats = pcall(vim.loop.fs_stat, args.file)
                if ok and stats and stats.size > 50 * 1024 * 1024 then -- 50MB limit
                    vim.b.large_file = true
                    vim.cmd("syntax off")
                    vim.cmd("filetype off")
                else
                    vim.b.large_file = false
                end
            end,
        })
    end,
}
