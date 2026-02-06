return {
    "stevearc/oil.nvim",
    config = function()
        require("oil").setup({
            buf_options = {
                modifiable = false,
            },
        })
        vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open file browser" })
    end,
}
