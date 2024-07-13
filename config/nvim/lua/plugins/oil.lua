---@type LazySpec
---@diagnostic disable-next-line: missing-fields
return {
    "stevearc/oil.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    ---@type oil.setupOpts
    opts = {
        delete_to_trash = true,
        view_options = { show_hidden = true },
        float = { border = "single" },
        preview = { border = "single" },
        progress = { border = "single" },
        ssh = { border = "single" },
        keymaps_help = { border = "single" },
    },
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
