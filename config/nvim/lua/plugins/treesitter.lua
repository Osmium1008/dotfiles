---@type LazySpec
---@diagnostic disable-next-line: missing-fields
return {
    "nvim-treesitter/nvim-treesitter",
    version = false,
    build = ":TSUpdate",
    lazy = false,
    opts_extend = { "ensure_installed" },
    config = function()
        ---@diagnostic disable-next-line: missing-fields
        require("nvim-treesitter.configs").setup({
            ensure_installed = {
                "bash",
                "c",
                "cpp",
                "lua",
                "vim",
                "vimdoc",
                "query",
                "markdown",
                "markdown_inline",
                "fish",
                "regex",
                "diff",
                "ssh_config",
                "typescript",
                "toml",
                "git_config",
                "gitignore",
                "ini",
                "json",
                "python",
            },
            sync_install = true,
            auto_install = true,
            highlight = {
                enable = true,
            },
        })
    end,
}