---@type LazySpec
---@diagnostic disable-next-line: missing-fields
return {
    "folke/tokyonight.nvim",
    config = function()
        vim.cmd("colorscheme tokyonight-night")
    end,
    lazy = false,
}
