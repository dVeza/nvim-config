return {
    {
        "VonHeikemen/lsp-zero.nvim",
        branch = "v3.x",
        lazy = false,
        dependencies = {
            { "williamboman/mason.nvim" },
            { "williamboman/mason-lspconfig.nvim" },
            { "neovim/nvim-lspconfig" },
            { "hrsh7th/nvim-cmp" },
            { "hrsh7th/cmp-nvim-lsp" },
            { "L3MON4D3/LuaSnip" },
        },
        config = function()
            local lsp_zero = require("lsp-zero")

            lsp_zero.on_attach(function(_, bufnr)
                lsp_zero.default_keymaps({ buffer = bufnr })
                local opts = { buffer = bufnr }
                vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
                vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
                vim.keymap.set("n", "<leader>ds", vim.diagnostic.open_float, opts)
                vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
                vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
            end)

            require("mason").setup({})
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "pyright",
                    "ruff",
                    "ts_ls",
                    "eslint",
                    "gopls",
                    "lua_ls",
                },
                handlers = {
                    lsp_zero.default_setup,
                    lua_ls = function()
                        require("lspconfig").lua_ls.setup(lsp_zero.nvim_lua_ls())
                    end,
                    pyright = function()
                        require("lspconfig").pyright.setup({
                            settings = {
                                pyright = {
                                    -- Defer linting to ruff
                                    disableOrganizeImports = true,
                                },
                                python = {
                                    analysis = {
                                        -- Ruff will handle these
                                        ignore = { "*" },
                                    },
                                },
                            },
                        })
                    end,
                    ruff = function()
                        require("lspconfig").ruff.setup({
                            on_attach = function(client, _)
                                -- Let pyright handle hover
                                client.server_capabilities.hoverProvider = false
                            end,
                        })
                    end,
                    gopls = function()
                        require("lspconfig").gopls.setup({
                            settings = {
                                gopls = {
                                    analyses = { unusedparams = true },
                                    staticcheck = true,
                                    gofumpt = true,
                                },
                            },
                        })
                    end,
                },
            })
        end,
    },
}
