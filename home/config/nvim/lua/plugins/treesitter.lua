return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
        ensure_installed = {
            "go", "ruby", "rust", "typescript", "javascript", "python",
            "lua", "bash", "json", "yaml", "toml", "html", "css",
            "markdown", "markdown_inline", "vim", "vimdoc",
        },
        auto_install = true,
    },
}
