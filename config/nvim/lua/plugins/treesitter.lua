---@type LazySpec
---@diagnostic disable-next-line: missing-fields
return {
    "nvim-treesitter/nvim-treesitter",
    version = false,
    lazy = false,
    opts_extend = { "ensure_installed" },
    main = "nvim-treesitter.configs",
    ---@type TSConfig
    ---@diagnostic disable-next-line: missing-fields
    opts = {
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
        auto_install = false,
        highlight = {
            enable = true,
        },
    },
}
