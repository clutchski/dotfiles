-- ==========================================================================
-- Options
-- ==========================================================================

vim.g.mapleader = " "

vim.opt.number = true
vim.opt.background = "dark"
vim.opt.undofile = true
vim.opt.wildignore = "*.sw*,*.bak,*.pyc,*.class,*.mako.py,*.o,*.egg,*.a"

-- Formatting
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.textwidth = 79

-- ==========================================================================
-- Key mappings
-- ==========================================================================

-- ; -> : for quick command mode
vim.keymap.set("n", ";", ":")

-- Disable ex-mode and recording
vim.keymap.set({ "n", "v" }, "Q", "<Nop>")
vim.keymap.set({ "n", "v" }, "q", "<Nop>")

-- Buffer navigation
vim.keymap.set("n", "<Tab>", ":bnext<CR>", { silent = true })
vim.keymap.set("n", "<S-Tab>", ":bprevious<CR>", { silent = true })

-- F1 -> Escape (don't open help accidentally)
vim.keymap.set({ "i", "n", "v" }, "<F1>", "<Esc>")

-- Navigate visual lines
vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")

-- ==========================================================================
-- Bootstrap lazy.nvim
-- ==========================================================================

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
    vim.fn.system({
        "git", "clone", "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- ==========================================================================
-- Plugins (auto-loads all files from lua/plugins/)
-- ==========================================================================

require("lazy").setup("plugins")
