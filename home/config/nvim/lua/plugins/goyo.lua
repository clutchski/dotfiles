return {
    "junegunn/goyo.vim",
    config = function()
        vim.api.nvim_create_autocmd("User", {
            pattern = "GoyoEnter",
            callback = function()
                local bg = vim.api.nvim_get_hl(0, { name = "Normal" }).bg
                if bg then
                    local color = string.format("#%06x", bg)
                    vim.cmd("highlight NonText guifg=" .. color)
                    vim.cmd("highlight StatusLineNC guibg=" .. color .. " guifg=" .. color)
                    vim.cmd("highlight VertSplit guibg=" .. color .. " guifg=" .. color)
                    vim.cmd("highlight WinSeparator guibg=" .. color .. " guifg=" .. color)
                end
                vim.opt.fillchars = { eob = " ", vert = " " }
            end,
        })
    end,
}
