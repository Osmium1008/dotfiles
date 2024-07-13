---@type LazySpec
---@diagnostic disable-next-line: missing-fields
return {
    "stevearc/oil.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    opts = {},
    lazy = false,
    keys = {
        {
            mode = "n",
            "<Leader>fd",
            "<cmd>Oil<CR>",
            desc = "Open Parent Directory",
        },
    },
}
