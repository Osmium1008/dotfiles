---@type LazySpec
---@diagnostic disable-next-line: missing-fields
return {
    "williamboman/mason-lspconfig.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "williamboman/mason.nvim",
        "neovim/nvim-lspconfig",
        "hrsh7th/cmp-nvim-lsp",
    },
    ---@type MasonLspconfigSettings
    opts = {},
    config = function()
        local capabilities = require("cmp_nvim_lsp").default_capabilities()

        local lspconfig = require("lspconfig")
        local mason_lspconfig = require("mason-lspconfig")

        ---@return string[]
        local function get_plugin_paths()
            local plugins = require("lazy").plugins()
            local paths = {}

            for _, plug in ipairs(plugins) do
                table.insert(paths, plug.dir .. "/lua")
            end
            return paths
        end

        ---@return string[]
        local function library()
            local paths = get_plugin_paths()
            table.insert(paths, vim.fn.stdpath("config") .. "/lua")
            table.insert(paths, vim.env.VIMRUNTIME .. "/lua")
            table.insert(paths, "${3rd}/luv/library")
            table.insert(paths, "${3rd}/busted/library")
            table.insert(paths, "${3rd}/luassert/library")
            return paths
        end

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
                                library = library(),
                                checkThirdParty = "Disable",
                            },
                        },
                    },
                    capabilities,
                })
            end,
        })
    end,
}
