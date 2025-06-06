vim.keymap.set("n", "j", "gj", { noremap = true })
vim.keymap.set("n", "k", "gk", { noremap = true })
vim.keymap.set("n", "<down>", "gj", { noremap = true })
vim.keymap.set("n", "<up>", "gk", { noremap = true })

vim.keymap.set("n", "<Leader>j", ":bprev<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<Leader>k", ":bnext<CR>", { noremap = true, silent = true })
--[[
vim.keymap.set("n", "<Leader>g", "<Nop>", { noremap = true })
vim.keymap.set("n", "<Leader>gs", ":G<CR><C-w>T", { noremap = true, silent = true })
vim.keymap.set("n", "<Leader>ga", ":Gwrite<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<Leader>gc", ":G commit<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<Leader>gb", ":G blame<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<Leader>gp", ":G pull<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<Leader>gd", ":Gdiff<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<Leader>gm", ":G merge<CR>", { noremap = true, silent = true })
]]
--vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>")
vim.keymap.set("n", "<Leader>fm", function()
    vim.lsp.buf.format({
        async = true,
        timeout_ms = 2000,
        filter = function(client)
            return client.name ~= "clangd" and client.name ~= "lua_ls"
        end,
    })
end)
