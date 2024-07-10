---@type LazySpec
---@diagnostic disable-next-line: missing-fields
return {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "rcarriga/nvim-notify",
        "nvim-telescope/telescope-fzy-native.nvim",
        {
            "danielfalk/smart-open.nvim",
            branch = "0.2.x",
            dependencies = {
                "kkharji/sqlite.lua",
            },
        },
    },
    config = function()
        require("telescope").load_extension("smart_open")
    end,
    keys = {
        {
            "<Leader>fg",
            mode = "n",
            function()
                require("telescope.builtin").live_grep()
            end,
            desc = "Live Grep",
        },
        {
            "<Leader>fb",
            mode = "n",
            function()
                require("telescope.builtin").buffers()
            end,
            desc = "Search Buffers",
        },
        {
            "<Leader>fh",
            mode = "n",
            function()
                require("telescope.builtin").help_tags()
            end,
            desc = "Help Tags",
        },
        {
            "<Leader>fn",
            mode = "n",
            function()
                require("telescope").extensions.notify.notify()
            end,
            desc = "Notification Histories",
        },
        {
            "<Leader><Leader>",
            mode = "n",
            function()
                require("telescope").extensions.smart_open.smart_open()
            end,
            desc = "Telescope Smart Finder",
        },
    },
}
