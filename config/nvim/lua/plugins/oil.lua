---@type LazySpec
---@diagnostic disable-next-line: missing-fields
return {
    "stevearc/oil.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    lazy = false,
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
    keys = {
        {
            mode = "n",
            "<Leader>fd",
            "<cmd>Oil<CR>",
            desc = "Open File Browser",
        },
        {
            mode = "n",
            "<Leader>ff",
            "<cmd>Oil --float<CR>",
            desc = "Open File Browser on Floating Window",
        }
    },
}
