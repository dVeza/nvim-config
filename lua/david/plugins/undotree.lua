return {
    {
        "mbbill/undotree",
        cmd = { "UndotreeToggle", "UndotreeShow", "UndotreeHide", "UndotreeFocus" },
        keys = {
            { "<leader>u", vim.cmd.UndotreeToggle, desc = "Toggle undotree" },
        },
    },
}
