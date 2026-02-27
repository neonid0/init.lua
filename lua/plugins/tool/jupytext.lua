return {
    "goerz/jupytext.nvim",
    version = "0.2.0",
    config = function()
        local jupytext = require("jupytext")
        jupytext.setup({
            jupytext = "jupytext",
            format = "markdown",
            update = true,
            filetype = jupytext.get_filetype,
            new_template = jupytext.default_new_template(),
            sync_patterns = { "*.md", "*.py", "*.jl", "*.R", "*.Rmd", "*.qmd" },
            autosync = true,
            handle_url_schemes = true,
        })
    end,
}
