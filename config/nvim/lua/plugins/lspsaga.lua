---@type LazySpec
---@diagnostic disable-next-line: missing-fields
return {
    "nvimdev/lspsaga.nvim",
    event = "LspAttach",
    ---@type LspsagaConfig
    opts = {
        ui = {
            border = "single",
            devicon = true,
            title = true,
        },
        lightbulb = {
            enable = false,
        },
        outline = {
            win_width = 50,
            auto_preview = false,
        },
    },
    dependencies = {
        "nvim-tree/nvim-web-devicons",
        "nvim-treesitter/nvim-treesitter",
    },
    keys = {
        {
            "K",
            mode = "n",
            "<cmd>Lspsaga hover_doc<CR>",
            desc = "Doc of Hovering Element",
        },
        {
            "<Leader>lr",
            mode = "n",
            "<cmd>Lspsaga finder ref<CR>",
            desc = "Display Reference",
        },
        {
            mode = "n",
            "<Leader>ld",
            "<cmd>Lspsaga peek_definition<CR>",
            desc = "Display Definition",
        },
        {
            mode = "n",
            "<Leader>lD",
            "<cmd>Lspsaga finder textDocument/declaration<CR>",
            desc = "Display Declaration",
        },
        {
            mode = "n",
            "<Leader>li",
            "<cmd>Lspsaga finder imp<CR>",
            desc = "Display Implemantion",
        },
        {
            mode = "n",
            "<Leader>lt",
            "<cmd>Lspsaga peek_type_definition<CR>",
            desc = "Display Type Definition",
        },
        {
            mode = "n",
            "<Leader>ln",
            "<cmd>Lspsaga rename<CR>",
            desc = "Rename",
        },
        {
            mode = "n",
            "<Leader>la",
            "<cmd>Lspsaga code_action<CR>",
            desc = "Select Suggested Action to do",
        },
        {
            mode = "n",
            "<Leader>lo",
            "<cmd>Lspsaga outline<CR>",
            "Display Outline",
        },
        {
            mode = "n",
            "<Leader>le",
            "<cmd>Lspsaga show_line_diagnostics<CR>",
            desc = "Display Line Diagnostics",
        },
        {
            mode = "n",
            "<Leader>]",
            "<cmd>Lspsaga diagnostic_jump_next<CR>",
            desc = "Jump next diagnostic by LSP",
        },
        {
            mode = "n",
            "<Leader>[",
            "<cmd>Lspsaga diagnostic_jump_prev<CR>",
            desc = "Jump previous diagnostic by LSP",
        },
    },
}
