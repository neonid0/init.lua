return {
    {
        -- Custom autocommands for document conversion
        dir = "~/.config/nvim",
        config = function()
            -- PDF to text conversion
            vim.api.nvim_create_autocmd({ "BufReadPost", "FileReadPost" }, {
                pattern = "*.pdf",
                callback = function()
                    local filename = vim.fn.expand("%:p")
                    local content = vim.fn.systemlist("pdftotext -layout " .. vim.fn.shellescape(filename) .. " -")
                    vim.api.nvim_buf_set_lines(0, 0, -1, false, content)
                    vim.bo.filetype = "text"
                    vim.opt_local.readonly = true
                    vim.opt_local.modifiable = false
                end,
            })

            -- DOCX to text conversion using pandoc
            vim.api.nvim_create_autocmd({ "BufReadPost", "FileReadPost" }, {
                pattern = "*.docx",
                callback = function()
                    local filename = vim.fn.expand("%:p")
                    local content = vim.fn.systemlist("pandoc " .. vim.fn.shellescape(filename) .. " -t plain")
                    vim.api.nvim_buf_set_lines(0, 0, -1, false, content)
                    vim.bo.filetype = "markdown"
                    vim.opt_local.readonly = true
                    vim.opt_local.modifiable = false
                end,
            })

            -- Excel files (xlsx, xls) to CSV conversion using libreoffice or ssconvert
            vim.api.nvim_create_autocmd({ "BufReadPost", "FileReadPost" }, {
                pattern = { "*.xlsx", "*.xls", "*.xlsm" },
                callback = function()
                    local filename = vim.fn.expand("%:p")
                    -- Try ssconvert first (from gnumeric), fallback to libreoffice
                    local cmd = "ssconvert "
                        .. vim.fn.shellescape(filename)
                        .. " fd://stdout 2>/dev/null || "
                        .. "libreoffice --headless --convert-to csv --outdir /tmp "
                        .. vim.fn.shellescape(filename)
                        .. " >/dev/null 2>&1 && cat /tmp/"
                        .. vim.fn.shellescape(vim.fn.expand("%:t:r"))
                        .. ".csv"
                    local content = vim.fn.systemlist(cmd)
                    vim.api.nvim_buf_set_lines(0, 0, -1, false, content)
                    vim.bo.filetype = "csv"
                    vim.opt_local.readonly = true
                    vim.opt_local.modifiable = false
                end,
            })
        end,
    },
}
