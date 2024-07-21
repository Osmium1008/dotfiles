-- 当ファイルには追加のライセンス表記があります
---@type LazySpec
---@diagnostic disable-next-line:missing-fields
return {
    "Osmium1008/skkeleton",
    branch = "master",
    event = "VeryLazy",
    config = function()
        local skkeleton = require("skkeleton")
        vim.keymap.set({ "i", "c", "t" }, [[<C-j>]], [[<Plug>(skkeleton-enable)]], { noremap = false })

        vim.api.nvim_create_augroup("skkeleton_settings", {})
        vim.api.nvim_create_autocmd("User", {
            group = "skkeleton_settings",
            pattern = "skkeleton-initialize-pre",
            callback = function()
                skkeleton.config({
                    eggLikeNewline = true,
                    sources = { "skk_server" },
                    globalKanaTableFiles = { { "~/.config/skk_general/kana-rule.conf", "euc-jp" } },
                    --skkServerResEnc = "utf-8",
                    --skkServerReqEnc = "utf-8",
                })
                skkeleton.register_keymap("input", "`", "katakana")
                skkeleton.register_keymap("input", "\"", "henkanPoint")
            end,
        })
        vim.api.nvim_create_autocmd({ "InsertEnter", "CmdlineEnter" }, {
            group = "skkeleton_settings",
            callback = function()
                skkeleton.initialize()
            end,
        })
        -- ここからしばらくのコードはAtusy (https://github.com/atusy) 氏によるコードの改変引用となります
        -- 以下「ここまで」と表記する箇所までのコードにはこのリポジトリのライセンスに加え以下に引用したライセンスが追加で適用されます
        --
        -- Original: https://github.com/atusy/dotfiles/blob/0bdc816ff6c4958fe330337374b1b79fd01c75a2/dot_config/nvim/lua/plugins/skkeleton/init.lua#L40
        -- オリジナルのライセンス表記は以下
        --MIT License
        --
        --Copyright (c) 2023 Atsushi Yasumoto
        --
        --Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
        --
        --The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
        --
        --THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
        vim.api.nvim_create_autocmd("User", {
            group = "skkeleton_settings",
            pattern = "skkeleton-enable-post",
            callback = function(ctx)
                vim.keymap.set( vim.api.nvim_get_mode().mode, ":", function()
                    local state = skkeleton.get_state()
                    local mode = skkeleton.get_mode()
                    if mode ~= "abbrev" and state.phase == "input:okurinasi" then
                        return [[<Cmd>call skkeleton#handle("handleKey", {"key": "\""})<CR>]]
                            .. [[<Cmd>call skkeleton#handle("handleKey", {"key": ";"})<CR>]]
                    end
                    return [[<Cmd>call skkeleton#handle("handleKey", {"key": ":"})<CR>]]
                end, { buffer = ctx.buf, expr = true })
            end,
        })
        vim.api.nvim_create_autocmd("User", {
            group = "skkeleton_settings",
            pattern = "skkeleton-disable-post",
            callback = function()
                pcall(vim.keymap.del, { "i", "c", "t" }, ":", { buffer = true })
            end,
        })
        -- ここまで
    end,
    dependencies = { "vim-denops/denops.vim", { "delphinus/skkeleton_indicator.nvim", opts = {} } },
}
