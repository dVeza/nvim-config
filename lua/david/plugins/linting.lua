return {
    {
        "mfussenegger/nvim-lint",
        event = { "BufReadPost", "BufNewFile" },
        config = function()
            local lint = require("lint")
            -- LSP-covered: python (ruff), ts/js (eslint). Add linters here only
            -- when an LSP doesn't already provide diagnostics.
            lint.linters_by_ft = {
                go = { "golangcilint" },
                markdown = { "markdownlint" },
                dockerfile = { "hadolint" },
            }

            local group = vim.api.nvim_create_augroup("nvim-lint", { clear = true })
            vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave" }, {
                group = group,
                callback = function() lint.try_lint() end,
            })
        end,
    },
}
