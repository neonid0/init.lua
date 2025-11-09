-- since this is just an example spec, don't actually load anything here and return an empty spec
-- stylua: ignore
if true then return {} end

-- every spec file under the "plugins" directory will be loaded automatically by lazy.nvim
--
-- In your plugin files, you can:
-- * add extra plugins
-- * disable/enabled LazyVim plugins
-- * override the configuration of LazyVim plugins
return {
    -- add gruvbox
    { "ellisonleao/gruvbox.nvim" },

    -- Configure LazyVim to load gruvbox
    {
        "LazyVim/LazyVim",
        opts = {
            colorscheme = "gruvbox",
        },
    },

    -- change trouble config
    {
        "folke/trouble.nvim",
        -- opts will be merged with the parent spec
        opts = { use_diagnostic_signs = true },
    },

    -- disable trouble
    { "folke/trouble.nvim", enabled = false },

    -- override nvim-cmp and add cmp-emoji
    {
        "hrsh7th/nvim-cmp",
        dependencies = { "hrsh7th/cmp-emoji" },
        ---@param opts cmp.ConfigSchema
        opts = function(_, opts)
            table.insert(opts.sources, { name = "emoji" })
        end,
    },

    -- change some telescope options and a keymap to browse plugin files
    {
        "nvim-telescope/telescope.nvim",
        keys = {
      -- add a keymap to browse plugin files
      -- stylua: ignore
      {
        "<leader>fp",
        function() require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root }) end,
        desc = "Find Plugin File",
      },
        },
        -- change some options
        opts = {
            defaults = {
                layout_strategy = "horizontal",
                layout_config = { prompt_position = "top" },
                sorting_strategy = "ascending",
                winblend = 0,
            },
        },
    },

    -- ~/.m2/repository/org/projectlombok/lombok/1.18.38/lombok-1.18.38.jar
    -- add pyright to lspconfig
    {
        "neovim/nvim-lspconfig",
        ---@class PluginLspOpts
        opts = {
            ---@type lspconfig.options
            servers = {
                -- pyright will be automatically installed with mason and loaded with lspconfig
                pyright = {},
            },
        },
    },

    -- add tsserver and setup with typescript.nvim instead of lspconfig
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "jose-elias-alvarez/typescript.nvim",
            init = function()
                require("lazyvim.util").lsp.on_attach(function(_, buffer)
          -- stylua: ignore
          vim.keymap.set( "n", "<leader>co", "TypescriptOrganizeImports", { buffer = buffer, desc = "Organize Imports" })
                    vim.keymap.set("n", "<leader>cR", "TypescriptRenameFile", { desc = "Rename File", buffer = buffer })
                end)
            end,
        },
        ---@class PluginLspOpts
        opts = {
            ---@type lspconfig.options
            servers = {
                -- tsserver will be automatically installed with mason and loaded with lspconfig
                tsserver = {},
            },
            -- you can do any additional lsp server setup here
            -- return true if you don't want this server to be setup with lspconfig
            ---@type table<string, fun(server:string, opts:_.lspconfig.options):boolean?>
            setup = {
                -- example to setup with typescript.nvim
                tsserver = function(_, opts)
                    require("typescript").setup({ server = opts })
                    return true
                end,
                -- Specify * to use this function as a fallback for any server
                -- ["*"] = function(server, opts) end,
            },
        },
    },

    -- {
    --     "neovim/nvim-lspconfig",
    --     dependencies = {
    --         "mason-org/mason.nvim",
    --     },
    --     opts = {
    --         -- Make sure jdtls is managed by mason-lspconfig
    --         servers = {
    --             jdtls = {},
    --         },
    --         -- Custom setup for jdtls
    --         setup = {
    --             jdtls = function(_, opts)
    --                 -- Find where mason has installed jdtls
    --                 local jdtls_path = vim.fn.glob(
    --                     vim.fn.stdpath("data")
    --                         .. "/mason/packages/jdtls/extension/server/plugins/org.eclipse.equinox.launcher_*.jar"
    --                 )
    --                 local jdtls_config_path =
    --                     vim.fn.glob(vim.fn.stdpath("data") .. "/mason/packages/jdtls/extension/server/config_*")
    --
    --                 local root_markers = { ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }
    --                 local root_dir = require("lspconfig.util").root_pattern(unpack(root_markers))
    --
    --                 local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
    --                 local workspace_dir = vim.fn.stdpath("cache") .. "/jdtls-workspace/" .. project_name
    --
    --                 -- The command to start the language server
    --                 local cmd = {
    --                     "java",
    --                     "-Declipse.application=org.eclipse.jdt.ls.core.id1",
    --                     "-Dosgi.bundles.defaultStartLevel=4",
    --                     "-Declipse.product=org.eclipse.jdt.ls.core.product",
    --                     "-Dlog.protocol=true",
    --                     "-Dlog.level=ALL",
    --                     "-Xms1g",
    --                     "--add-modules=ALL-SYSTEM",
    --                     "--add-opens",
    --                     "java.base/java.util=ALL-UNNAMED",
    --                     "--add-opens",
    --                     "java.base/java.lang=ALL-UNNAMED",
    --
    --                     -- THIS IS THE CRUCIAL LINE FOR LOMBOK
    --                     -- ~/.m2/repository/org/projectlombok/lombok/1.18.36/lombok-1.18.36.jar
    --                     -- ~/.m2/repository/org/projectlombok/lombok/1.18.38/lombok-1.18.38.jar
    --                     -- ~/.m2/repository/org/projectlombok/lombok/1.18.34/lombok-1.18.34.jar
    --                     "-javaagent:~/.m2/repository/org/projectlombok/lombok/1.18.36/lombok-1.18.36.jar",
    --
    --                     "-jar",
    --                     vim.fn.glob(jdtls_path),
    --                     "-configuration",
    --                     vim.fn.glob(jdtls_config_path),
    --                     "-data",
    --                     workspace_dir,
    --                 }
    --
    --                 -- Configure and start the server
    --                 require("lspconfig").jdtls.setup({
    --                     cmd = cmd,
    --                     root_dir = root_dir,
    --                     -- You can add other jdtls settings here if needed
    --                 })
    --
    --                 -- Prevent the default setup from running
    --                 return true
    --             end,
    --         },
    --     },
    -- },

    -- for typescript, LazyVim also includes extra specs to properly setup lspconfig,
    -- treesitter, mason and typescript.nvim. So instead of the above, you can use:
    { import = "lazyvim.plugins.extras.lang.typescript" },

    -- add more treesitter parsers
    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            ensure_installed = {
                "bash",
                "html",
                "javascript",
                "json",
                "lua",
                "markdown",
                "markdown_inline",
                "python",
                "query",
                "regex",
                "tsx",
                "typescript",
                "vim",
                "yaml",
            },
        },
    },

    -- since `vim.tbl_deep_extend`, can only merge tables and not lists, the code above
    -- would overwrite `ensure_installed` with the new value.
    -- If you'd rather extend the default config, use the code below instead:
    {
        "nvim-treesitter/nvim-treesitter",
        opts = function(_, opts)
            -- add tsx and treesitter
            vim.list_extend(opts.ensure_installed, {
                "tsx",
                "typescript",
            })
        end,
    },

    -- the opts function can also be used to change the default opts:
    {
        "nvim-lualine/lualine.nvim",
        event = "VeryLazy",
        opts = function(_, opts)
            table.insert(opts.sections.lualine_x, {
                function()
                    return "😄"
                end,
            })
        end,
    },

    -- or you can return new options to override all the defaults
    {
        "nvim-lualine/lualine.nvim",
        event = "VeryLazy",
        opts = function()
            return {
                options = {
                    -- make lualine transparent
                    theme = "auto", -- auto uses current colorscheme
                    component_separators = "|",
                    section_separators = "",
                    globalstatus = true, -- if using Neovim 0.8+
                    -- set no background
                    always_divide_middle = true,
                },
                sections = {
                    lualine_a = { "mode" },
                    lualine_b = { "branch" },
                    lualine_c = { "filename" },
                    lualine_x = { "encoding", "fileformat", "filetype" },
                    lualine_y = { "progress" },
                    lualine_z = { "location" },
                },
                inactive_sections = {
                    lualine_a = {},
                    lualine_b = {},
                    lualine_c = { "filename" },
                    lualine_x = { "location" },
                    lualine_y = {},
                    lualine_z = {},
                },
                extensions = {},
            }
        end,
        config = function(_, opts)
            require("lualine").setup(opts)

            -- make lualine highlights transparent
            local groups = {
                "Normal",
                "StatusLine",
                "StatusLineNC",
                "VertSplit",
                "TabLine",
                "TabLineFill",
                "TabLineSel",
            }
            for _, group in ipairs(groups) do
                vim.api.nvim_set_hl(0, group, { bg = "NONE" })
            end
        end,
    },

    -- use mini.starter instead of alpha
    { import = "lazyvim.plugins.extras.ui.mini-starter" },

    -- add jsonls and schemastore packages, and setup treesitter for json, json5 and jsonc
    { import = "lazyvim.plugins.extras.lang.json" },

    -- add any tools you want to have installed below
    {
        "williamboman/mason.nvim",
        opts = {
            ensure_installed = {
                "stylua",
                "shellcheck",
                "shfmt",
                "flake8",
            },
        },
    },
}
