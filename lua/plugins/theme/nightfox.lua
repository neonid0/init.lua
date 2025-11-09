return {
    "EdenEast/nightfox.nvim",
    opts = {
        transparent = true,
        groups = {
            carbonfox = {
                Normal = { bg = "none" },
                NormalNC = { bg = "none" },
                NormalFloat = { bg = "none" },
                FloatBorder = { bg = "none" },
                CursorLine = { bg = "#222222" },
                SignColumn = { bg = "none" },
                VertSplit = { bg = "none" },
                StatusLine = { bg = "none" },
                StatusLineNC = { bg = "none" },
                NeoTreeNormal = { bg = "none" },
                NeoTreeNormalNC = { bg = "none" },
                NeoTreeEndOfBuffer = { bg = "none" },
                NeoTreeVertSplit = { bg = "none" },
                NeoTreeWinSeparator = { bg = "none" },
            },
        },
    },
    config = function(_, opts)
        require("nightfox").setup(opts)
        vim.cmd("colorscheme carbonfox") -- or tokyonight/nightfox/etc.
    end,
}
