return {
    "ibhagwan/fzf-lua",
    config = function()
        local fzf = require("fzf-lua")
        vim.keymap.set("n", "<C-p>", fzf.files, { desc = "Find files" })
        vim.keymap.set("n", "<leader>b", fzf.buffers, { desc = "Find buffers" })
        vim.keymap.set("n", "<leader>g", fzf.live_grep, { desc = "Live grep" })
    end,
}
