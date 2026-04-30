return {
    {
        "nvim-neotest/neotest",
        dependencies = {
            "nvim-neotest/nvim-nio",
            "nvim-lua/plenary.nvim",
            "antoinemadec/FixCursorHold.nvim",
            "nvim-treesitter/nvim-treesitter",
            "nvim-neotest/neotest-python",
            "nvim-neotest/neotest-jest",
            "fredrikaverpil/neotest-golang",
        },
        keys = {
            { "<leader>nr", function() require("neotest").run.run() end, desc = "Run nearest test" },
            { "<leader>nf", function() require("neotest").run.run(vim.fn.expand("%")) end, desc = "Run file tests" },
            { "<leader>nd", function() require("neotest").run.run({ strategy = "dap" }) end, desc = "Debug nearest test" },
            { "<leader>ns", function() require("neotest").summary.toggle() end, desc = "Toggle test summary" },
            { "<leader>no", function() require("neotest").output.open({ enter = true }) end, desc = "Open test output" },
            { "<leader>nO", function() require("neotest").output_panel.toggle() end, desc = "Toggle output panel" },
        },
        config = function()
            require("neotest").setup({
                adapters = {
                    -- NOTE: For Rover, tests run in Docker via the `t` alias.
                    -- Neotest runs pytest directly, so it won't work against
                    -- Rover's Dockerized test env without extra glue. Use the
                    -- toggleterm window + `t app.tests.foo` for Rover, and
                    -- neotest for local/venv-based projects.
                    require("neotest-python")({
                        dap = { justMyCode = false },
                        runner = "pytest",
                    }),
                    require("neotest-jest")({
                        jestCommand = "pnpm jest --",
                    }),
                    require("neotest-golang")({}),
                },
            })
        end,
    },
}
