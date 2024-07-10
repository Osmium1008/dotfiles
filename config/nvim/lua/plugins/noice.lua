---@type LazySpec
---@diagnostic disable-next-line: missing-fields
return {
    "folke/noice.nvim",
    event = "VeryLazy",
    ---@type NoiceConfig
    ---@diagnostic disable-next-line: missing-fields
    opts = {
        preset = {
            long_message_to_split = true,
            lsp_doc_border = false,
        },
    },
    dependencies = {
        "MunifTanjim/nui.nvim",
        "rcarriga/nvim-notify",
    },
}
