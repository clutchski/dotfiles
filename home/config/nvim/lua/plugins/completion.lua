return {
    "saghen/blink.cmp",
    version = "1.*",
    opts = {
        keymap = { preset = "default" },
        completion = {
            documentation = { auto_show = true },
        },
        sources = {
            default = { "lsp", "path", "buffer" },
        },
    },
}
