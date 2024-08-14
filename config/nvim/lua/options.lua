vim.scriptencoding = "utf-8"
vim.g.mapleader = " "
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_2html_plugin = 1
vim.g.loaded_gzip = 1
vim.g.loaded_man = 1
vim.g.loaded_matchparen = 1
vim.g.loaded_remote_plugins = 1
vim.g.loaded_shada_plugin = 1
vim.g.loaded_spellfile_plugin = 1
vim.g.loaded_tarPlugin = 1
vim.g.loaded_zipPlugin = 1
vim.g.skip_loading_mswin = 1
vim.g.did_install_syntax_menu = 1
vim.g.did_install_default_menus = 1
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
