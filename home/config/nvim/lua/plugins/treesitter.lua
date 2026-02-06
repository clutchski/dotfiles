return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = {
                "go", "ruby", "rust", "typescript", "javascript", "python",
                "lua", "bash", "json", "yaml", "toml", "html", "css",
                "markdown", "markdown_inline", "vim", "vimdoc",
            },
            auto_install = true,
            highlight = { enable = true },
            indent = { enable = true },
        })
    end,
}
