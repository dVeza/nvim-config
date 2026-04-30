return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        event = { "BufReadPost", "BufNewFile" },
        main = "nvim-treesitter.configs",
        opts = {
            ensure_installed = {
                "c", "lua", "vim", "vimdoc", "query",
                "python",
                "javascript", "typescript", "tsx",
                "go", "gomod", "gosum",
                "html", "htmldjango", "css",
                "json", "jsonc", "yaml", "toml",
                "markdown", "markdown_inline",
                "bash", "dockerfile",
                "gitcommit", "diff",
            },
            sync_install = false,
            auto_install = true,
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
            indent = { enable = true },
        },
    },
    {
        "nvim-treesitter/nvim-treesitter-context",
        event = { "BufReadPost", "BufNewFile" },
        opts = {
            max_lines = 3,
            min_window_height = 20,
        },
        keys = {
            { "<leader>tc", function() require("treesitter-context").toggle() end, desc = "Toggle treesitter context" },
        },
    },
    {
        "nvim-treesitter/playground",
        cmd = { "TSPlaygroundToggle", "TSHighlightCapturesUnderCursor", "TSNodeUnderCursor" },
    },
}
