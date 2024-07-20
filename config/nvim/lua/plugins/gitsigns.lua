---@type LazySpec
---@diagnostic disable-next-line: missing-fields
return {
    "lewis6991/gitsigns.nvim",
    ---@type Gitsigns.Config
    ---@diagnostic disable-next-line: missing-fields
    opts = {},
    event = { "BufReadPre", "BufNewFile" },
}
