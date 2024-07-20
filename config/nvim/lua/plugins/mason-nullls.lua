---@type LazySpec
---@diagnostic disable-next-line: missing-fields
return {
    "jay-babu/mason-null-ls.nvim",
    dependencies = {
        "williamboman/mason.nvim",
        {
            "nvimtools/none-ls.nvim",
            dependencies = "nvim-lua/plenary.nvim",
        },
    },
    event = { "BufReadPre", "BufNewFile" },
    ---@type MasonNullLsSettings
    ---@diagnostic disable-next-line: missing-fields
    opts = {
        handlers = {},
    },
}
