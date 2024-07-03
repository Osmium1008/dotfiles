---@diagnostic disable-next-line: missing-fields
require("nvim-treesitter.configs").setup({
    ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline", "fish", "regex" },
    sync_install = false,
    auto_install = true,
    ignore_install = {},
    highlight = {
        enable = true,
    },
})

require("satysfi-nvim").setup()

local capabilities = require("cmp_nvim_lsp").default_capabilities()

local lspconfig = require("lspconfig")
local mason_lspconfig = require("mason-lspconfig")

---@param names string[]
---@return string[]
local function get_plugin_paths(names)
    local plugins = require("lazy.core.config").plugins
    local paths = {}
    for _, name in ipairs(names) do
        if plugins[name] then
            table.insert(paths, plugins[name].dir .. "/lua")
        else
            vim.notify("Invalid plugin name: " .. name)
        end
    end
    return paths
end

---@param plugins string[]
---@return string[]
local function library(plugins)
    local paths = get_plugin_paths(plugins)
    table.insert(paths, vim.fn.stdpath("config") .. "/lua")
    table.insert(paths, vim.env.VIMRUNTIME .. "/lua")
    table.insert(paths, "${3rd}/luv/library")
    table.insert(paths, "${3rd}/busted/library")
    table.insert(paths, "${3rd}/luassert/library")
    return paths
end

mason_lspconfig.setup({})
mason_lspconfig.setup_handlers({
    function(server_name)
        lspconfig[server_name].setup({ capabilities })
    end,
    lua_ls = function()
        lspconfig.lua_ls.setup({
            settings = {
                Lua = {
                    runtime = {
                        version = "LuaJIT",
                        pathStrict = true,
                        path = { "?.lua", "?/init.lua" },
                    },
                    workspace = {
                        library = library({
                            "lazy.nvim",
                            "nvim-cmp",
                            "lualine.nvim",
                            "tokyonight.nvim",
                            "nvim-treesitter",
                            "telescope.nvim",
                            "plenary.nvim",
                            "smart-open.nvim",
                            "nvim-tree.lua",
                            "nvim-tree.lua-float-preview",
                            "nvim-lspconfig",
                            "lspsaga.nvim",
                            "none-ls.nvim",
                            "satysfi.nvim",
                            "lspkind.nvim",
                            "cmp-cmdline",
                            "cmp_luasnip",
                            "cmp-nvim-lsp",
                            "cmp-buffer",
                            "cmp-async-path",
                            "LuaSnip",
                            "noice.nvim",
                            "mason.nvim",
                            "mason-lspconfig.nvim",
                            "mason-null-ls.nvim",
                            "nvim-autopairs",
                        }),
                        checkThirdParty = "Disable",
                    },
                },
            },
            capabilities,
        })
    end,
})

lspconfig.satysfi_ls.setup({ capabilities })
