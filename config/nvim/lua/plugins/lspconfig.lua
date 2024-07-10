---@type LazySpec
---@diagnostic disable-next-line: missing-fields
return {
    "neovim/nvim-lspconfig",
    config = function()
        require("lspconfig.ui.windows").default_options.border = "single"
    end,
}
