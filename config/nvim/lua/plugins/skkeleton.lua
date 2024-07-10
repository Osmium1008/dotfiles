---@type LazySpec
---@diagnostic disable-next-line:missing-fields
return {
    "vim-skk/skkeleton",
    lazy = false,
    config = function()
        vim.keymap.set({ "i", "c", "t" }, [[<C-j>]], [[<Plug>(skkeleton-enable)]], { noremap = false })

        vim.api.nvim_create_augroup("skkeleton_settings", {})
        vim.api.nvim_create_autocmd("User", {
            group = "skkeleton_settings",
            pattern = "skkeleton-initialize-pre",
            callback = function()
                vim.fn["skkeleton#config"]({
                    eggLikeNewline = true,
                    sources = { "skk_server" },
                    globalKanaTableFiles = { { "~/.config/skk_general/kana-rule.conf", "euc-jp" } },
                    --skkServerResEnc = "utf-8",
                    --skkServerReqEnc = "utf-8",
                })
                vim.fn.add(vim.g["skkeleton#mapped_keys"], ":")
                vim.fn.add(vim.g["skkeleton#mapped_keys"], ";")
                vim.fn.add(vim.g["skkeleton#mapped_keys"], "\"")
                vim.fn["skkeleton#register_keymap"]("input", "`", "katakana")
                vim.fn["skkeleton#register_keymap"]("input", "\"", "henkanPoint")
            end,
        })
        vim.api.nvim_create_autocmd({ "InsertEnter", "CmdlineEnter" }, {
            group = "skkeleton_settings",
            callback = function()
                vim.fn["skkeleton#initialize"]()
            end,
        })
        vim.api.nvim_create_autocmd("User", {
            group = "skkeleton_settings",
            pattern = "skkeleton-enable-post",
            callback = function()
                vim.keymap.set({ "i", "c", "t" }, ":", function()
                    local state = vim.g["skkeleton#state"]
                    local mode = vim.fn["skkeleton#mode"]()
                    if mode ~= "abbrev" and state.phase == "input:okurinasi" then
                        return [[<Cmd>call skkeleton#handle("handleKey", {"key": "\""})<CR>]]
                            .. [[<Cmd>call skkeleton#handle("handleKey", {"key": ";"})<CR>]]
                    end
                    return [[<Cmd>call skkeleton#handle("handleKey", {"key": ":"})<CR>]]
                end, { buffer = true, expr = true })
            end,
        })
        vim.api.nvim_create_autocmd("User", {
            group = "skkeleton_settings",
            pattern = "skkeleton-disable-post",
            callback = function()
                pcall(vim.keymap.del, { "i", "c", "t" }, ":", { buffer = true })
            end,
        })
    end,
    dependencies = { "vim-denops/denops.vim", { "delphinus/skkeleton_indicator.nvim", opts = {} } },
}
