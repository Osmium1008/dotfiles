---@type LazySpec
---@diagnostic disable-next-line:missing-fields
return {
    "vim-skk/skkeleton",
    event = "VeryLazy",
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
                    lowercaseMap = {
                        [":"] = ";",
                    },
                    --skkServerResEnc = "utf-8",
                    --skkServerReqEnc = "utf-8",
                })
                vim.fn["skkeleton#register_keymap"]("input", "`", "katakana")
            end,
        })
        vim.api.nvim_create_autocmd({ "InsertEnter", "CmdlineEnter" }, {
            group = "skkeleton_settings",
            callback = function()
                vim.fn["skkeleton#initialize"]()
            end,
        })
    end,
    dependencies = { "vim-denops/denops.vim", { "delphinus/skkeleton_indicator.nvim", opts = {} } },
}
