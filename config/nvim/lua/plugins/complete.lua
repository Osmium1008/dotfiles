---@type LazySpec
---@diagnostic disable-next-line: missing-fields
return {
    "hrsh7th/nvim-cmp",
    dependencies = {
        "onsails/lspkind.nvim",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-nvim-lua",
        "hrsh7th/cmp-buffer",
        url = "https://codeberg.org/FelipeLema/cmp-async-path.git",
        {
            "windwp/nvim-autopairs",
            opts = {},
        },
    },
    event = { "InsertEnter", "CmdwinEnter", "CmdlineEnter" },
    config = function()
        local cmp = require("cmp")
        local cmp_autopairs = require("nvim-autopairs.completion.cmp")
        cmp.setup({
            mapping = cmp.mapping.preset.insert({
                ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                ["<C-f>"] = cmp.mapping.scroll_docs(4),
                ["<C-Space>"] = cmp.mapping.complete(),
                ["<C-e>"] = cmp.mapping.abort(),
                ["<CR>"] = cmp.mapping.confirm({ select = false }),
            }),
            sources = cmp.config.sources({
                { name = "nvim_lsp" },
                { name = "nvim_lua" },
            }, {
                { name = "buffer" },
            }),
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },
            ---@diagnostic disable-next-line: missing-fields
            formatting = {
                format = require("lspkind").cmp_format({
                    mode = "symbol_text",
                    maxWidth = 50,
                    ellipses_char = "...",
                    show_labelDetails = true,
                    menu = {
                        buffer = "[Buffer]",
                        nvim_lsp = "[LSP]",
                        nvim_lua = "[Lua]",
                        async_path = "[Path]",
                        cmdline = "[Command]",
                    },
                }),
            },
            preselect = cmp.PreselectMode.None,
        })
        cmp.setup.cmdline({ "/", "?" }, {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
                { name = "buffer" },
            },
        })
        cmp.setup.cmdline({ ":" }, {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
                { name = "async_path" },
            }, {
                { name = "cmdline" },
            }),
            ---@diagnostic disable-next-line: missing-fields
            matching = { disallow_symbol_nonprefix_matching = false },
        })
        cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
    end,
}
