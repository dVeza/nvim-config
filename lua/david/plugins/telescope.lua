return {
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.8",
        dependencies = { "nvim-lua/plenary.nvim" },
        keys = {
            { "<leader>ff", function() require("telescope.builtin").find_files() end, desc = "Find files" },
            { "<C-p>", function() require("telescope.builtin").git_files() end, desc = "Git files" },
            { "<C-f>", function() require("telescope.builtin").live_grep() end, desc = "Live grep" },
            { "<C-b>", function() require("telescope.builtin").buffers() end, desc = "Buffers" },
            { "<leader>fh", function() require("telescope.builtin").help_tags() end, desc = "Help tags" },
            { "<leader>fd", function() require("telescope.builtin").diagnostics() end, desc = "Diagnostics" },
            { "<leader>fr", function() require("telescope.builtin").resume() end, desc = "Resume last picker" },
            { "<leader>fs", function() require("telescope.builtin").lsp_document_symbols() end, desc = "Document symbols" },
            { "<leader>fw", function() require("telescope.builtin").grep_string() end, desc = "Grep word under cursor" },
        },
    },
}
