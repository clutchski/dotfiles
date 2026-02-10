return {
    "folke/snacks.nvim",
    priority = 1000,
    opts = {
        dashboard = {
            sections = {
                { section = "header" },
                { title = "Recent Files", padding = 1 },
                {
                    section = "recent_files",
                    limit = 5,
                    padding = 1,
                    filter = function(file)
                        return not file:find("/.git/", 1, true)
                    end,
                },
                { section = "keys", gap = 1 },
            },
            preset = {
                header = [[
 ʕ·ᴥ·ʔ]],
            },
        },
    },
}
