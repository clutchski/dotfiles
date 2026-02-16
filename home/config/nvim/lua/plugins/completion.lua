return {
    "saghen/blink.cmp",
    version = "1.*",
    opts = {
        enabled = function()
            return not vim.g.prose_mode
        end,
        keymap = { preset = "default" },
        completion = {
            documentation = { auto_show = true },
        },
        sources = {
            default = { "lsp", "path", "buffer" },
        },
    },
}
