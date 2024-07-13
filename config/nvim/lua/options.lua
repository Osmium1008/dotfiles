vim.scriptencoding = "utf-8"
vim.g.mapleader = " "
-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1
vim.opt.number = true
vim.opt.autoindent = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.cursorline = true
vim.opt.whichwrap = "b,s,h,l,<,>,[,],~"
vim.opt.hidden = true
vim.opt.clipboard:prepend("unnamedplus")
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.updatetime = 300
vim.opt.shortmess:append("c")
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"
vim.opt.fileencodings = "utf-8,sjis,iso-2022-jp,euc-jp"
vim.opt.fileformat = "unix"
vim.opt.fileformats = "unix,dos"
vim.opt.signcolumn = "yes"

if vim.fn.has("termguicolors") == 1 then
    vim.opt.termguicolors = true
end

vim.opt.showmode = false

if vim.g.unix_file_icons == "" then
    vim.g.unix_file_icons = ""
end
