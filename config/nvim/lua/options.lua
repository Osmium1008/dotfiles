vim.g.mapleader = " "
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
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

if vim.fn.has("patch-8.1.1564") == 1 then
    vim.opt.signcolumn = "number"
else
    vim.opt.signcolumn = "yes"
end

if vim.fn.has("termguicolors") == 1 then
    vim.opt.termguicolors = true
end

vim.opt.showmode = false
