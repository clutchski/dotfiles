return {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    config = function()
        require("gruvbox").setup({
            contrast = "hard",
            overrides = {
                Normal = { bg = "#080808" },
                NormalFloat = { bg = "#080808" },
            },
        })
        vim.cmd.colorscheme("gruvbox")
    end,
}
