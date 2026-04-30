return {
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        opts = {},
        keys = {
            { "<leader>?", function() require("which-key").show({ global = false }) end, desc = "Buffer keymaps" },
        },
    },
    {
        "numToStr/Comment.nvim",
        event = { "BufReadPost", "BufNewFile" },
        opts = {},
    },
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        opts = {},
    },
}
