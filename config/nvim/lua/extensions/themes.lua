vim.cmd("colorscheme tokyonight-night")

require("lualine").setup({
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
        lualine_y = { "encoding", { "fileformat", symbols = { unix = vim.g.unix_file_icons } } },
    },
    tabline = {
        lualine_a = { { "buffers", symbols = { modified = "_󰷥", alternate_file = " ", directory = " " } } },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = { "tabs" },
    },
})

require("lspconfig.ui.windows").default_options.border = "rounded"
