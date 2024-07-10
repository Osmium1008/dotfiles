--require("extensions/manager")
--require("extensions/themes")
--require("extensions/complete")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "git@github.com:folke/lazy.nvim.git",
        "--branch=main", -- latest stable release
        lazypath,
    })
end
---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    spec = {
        import = "plugins",
    },
    checker = {
        enabled = true,
        notify = false,
    },
    git = {
        url_format = "git@github.com:%s.git",
    },
    rocks = {
        enabled = false,
    },
    defaults = {
        lazy = true,
    },
})
