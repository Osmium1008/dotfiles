---@type LazySpec
---@diagnostic disable-next-line: missing-fields
return {
    "nvim-lualine/lualine.nvim",
    lazy = false,
    dependencies = {
        "nvim-tree/nvim-web-devicons",
        "folke/lazy.nvim",
    },
    opts = {
        options = {
            component_separators = { left = "", right = "" },
            globalstatus = true,
        },
        sections = {
            lualine_x = {
                {
                    require("lazy.status").updates,
                    cond = require("lazy.status").has_updates,
                    color = { fg = "#ff9e64" },
                },
                "filetype",
            },
            lualine_y = {
                "encoding",
                {
                    "fileformat",
                    symbols = {
                        unix = "󰁍",
                        dos = "󰌑",
                        mac = "󰁅",
                    },
                },
            },
        },
        tabline = {
            lualine_a = {
                {
                    "buffers",
                    symbols = {
                        modified = "_󰷥",
                        alternate_file = " ",
                        directory = " ",
                    },
                },
            },
            lualine_b = {},
            lualine_c = {},
            lualine_x = {},
            lualine_y = {},
            lualine_z = {
                "tabs",
            },
        },
    },
}
