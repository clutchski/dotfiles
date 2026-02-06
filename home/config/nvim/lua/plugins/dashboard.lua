return {
    "folke/snacks.nvim",
    priority = 1000,
    opts = {
        dashboard = {
            sections = {
                { section = "header" },
                { title = "Recent Files", padding = 1 },
                { section = "recent_files", limit = 5, padding = 1 },
                { section = "keys", gap = 1 },
            },
            preset = {
                header = [[
 ʕ·ᴥ·ʔ]],
            },
        },
    },
}
