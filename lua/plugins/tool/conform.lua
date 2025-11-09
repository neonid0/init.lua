return {
    "stevearc/conform.nvim",
    opts = {
        formatters_by_ft = {
            python = { "isort", "black" },
        },
        formatters = {
            isort = {
                prepend_args = {
                    "--profile",
                    "black",
                    "--multi-line",
                    "3",
                    "--force-grid-wrap",
                    "2",
                },
            },

            black = {
                command = "black",
                args = {
                    "--line-length",
                    "88",
                    "--skip-string-normalization",
                    "--preview",
                    "-", -- THIS is what tells Black to read from stdin
                },
                stdin = true,
            },
        },
    },
}
