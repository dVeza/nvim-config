return {
    {
        "akinsho/toggleterm.nvim",
        version = "*",
        keys = {
            { "<C-\\>", "<cmd>ToggleTerm<cr>", mode = { "n", "t" }, desc = "Toggle terminal" },
            { "<leader>tt", "<cmd>ToggleTerm direction=horizontal<cr>", desc = "Terminal (horizontal)" },
            { "<leader>tv", "<cmd>ToggleTerm direction=vertical size=80<cr>", desc = "Terminal (vertical)" },
            { "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", desc = "Terminal (float)" },
        },
        opts = {
            size = 15,
            open_mapping = [[<C-\>]],
            shade_terminals = true,
            start_in_insert = true,
            persist_size = true,
            direction = "horizontal",
        },
    },
}
