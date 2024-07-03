local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "git@github.com:folke/lazy.nvim.git",
        "--branch=main", -- latest stable release
        lazypath,
    })
end
---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

local NVIM_TREE_WIDTH_PADDING = 8
local NVIM_TREE_HEIGHT_PADDING = 5

require("lazy").setup({
    spec = {
        -- environments
        {"folke/lazy.nvim", branch="main"},
        "vim-jp/vimdoc-ja",
        "vim-denops/denops.vim",

        -- Themes
        "nvim-tree/nvim-web-devicons",
        "Shatur/neovim-ayu",
        "folke/tokyonight.nvim",
        {
            "nvim-lualine/lualine.nvim",
            dependencies = {
                "nvim-tree/nvim-web-devicons",
            },
        },

        -- UIs
        {
            "folke/noice.nvim",
            event = "VeryLazy",
            config = function()
                require("noice").setup({})
            end,
            dependencies = {
                -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
                "MunifTanjim/nui.nvim",
                -- OPTIONAL:
                --   `nvim-notify` is only needed, if you want to use the notification view.
                --   If not available, we use `mini` as the fallback
                "rcarriga/nvim-notify",
            },
        },

        -- Highlighter
        { "nvim-treesitter/nvim-treesitter", tag = "v0.9.2" },

        -- fuzzy finder
        {
            "nvim-telescope/telescope.nvim",
            branch = "0.1.x",
            dependencies = {
                "nvim-lua/plenary.nvim",
                "nvim-tree/nvim-web-devicons",
                "rcarriga/nvim-notify",
            },
            lazy = true,
            keys = {
                {
                    "<Leader>ff",
                    mode = "n",
                    function()
                        require("telescope.builtin").find_files()
                    end,
                    desc = "Find Files",
                },
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
                    desc = "nvim-notify histories",
                },
            },
        },
        {
            "danielfalk/smart-open.nvim",
            branch = "0.2.x",
            config = function()
                require("telescope").load_extension("smart_open")
            end,
            dependencies = {
                "nvim-telescope/telescope.nvim",
                "kkharji/sqlite.lua",
                "nvim-telescope/telescope-fzy-native.nvim",
            },
            lazy = true,
            keys = {
                {
                    "<Leader><Leader>",
                    mode = "n",
                    function()
                        require("telescope").extensions.smart_open.smart_open()
                    end,
                    desc = "Telescope Smart Finder",
                },
            },
        },

        -- filer
        {
            "nvim-tree/nvim-tree.lua",
            dependencies = {
                "nvim-tree/nvim-web-devicons",
                {
                    "JMarkin/nvim-tree.lua-float-preview",
                    lazy = true,
                    opts = {
                        -- toggled_on = false,
                        wrap_nvimtree_commands = true,
                        window = {
                            wrap = false,
                            trim_height = false,
                            open_win_config = function()
                                local screen_w = vim.opt.columns:get()
                                local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
                                local window_w = screen_w - NVIM_TREE_WIDTH_PADDING * 2 - 41
                                local window_h = screen_h - NVIM_TREE_HEIGHT_PADDING * 2
                                local center_x = NVIM_TREE_WIDTH_PADDING + 42
                                local center_y = ((vim.opt.lines:get() - window_h) / 2) - vim.opt.cmdheight:get()

                                return {
                                    style = "minimal",
                                    relative = "editor",
                                    border = "single",
                                    row = center_y,
                                    col = center_x,
                                    width = window_w,
                                    height = window_h,
                                }
                            end,
                        },
                        mapping = {
                            -- scroll down float buffer
                            down = { "<C-d>" },
                            -- scroll up float buffer
                            up = { "<C-e>", "<C-u>" },
                            -- enable/disable float windows
                            toggle = { "<C-x>" },
                        },
                        hooks = {
                            pre_open = function(path)
                                local is_showed = require("float-preview.utils").is_showed(path)
                                if is_showed then
                                    return false
                                end
                                local is_text = require("float-preview.utils").is_text(path)
                                if not is_text then
                                    return false
                                end

                                -- if file > 5 MB or not text -> not preview
                                local size = require("float-preview.utils").get_size(path)
                                if type(size) ~= "number" then
                                    return false
                                end

                                if size > 5 then
                                    return false
                                end

                                return true
                            end,
                            ---@diagnostic disable-next-line: unused-local
                            post_open = function(bufnr)
                                return true
                            end,
                        },
                    },
                },
            },
            config = function()
                require("nvim-tree").setup({
                    on_attach = function(bufnr)
                        local api = require("nvim-tree.api")
                        local FloatPreview = require("float-preview")

                        local git_add = function()
                            local node = api.tree.get_node_under_cursor()
                            local gs = node.git_status.file

                            -- If the current node is a directory get children status
                            if gs == nil then
                                gs = (node.git_status.dir.direct ~= nil and node.git_status.dir.direct[1])
                                    or (node.git_status.dir.indirect ~= nil and node.git_status.dir.indirect[1])
                            end

                            -- If the file is untracked, unstaged or partially staged, we stage it
                            if gs == "??" or gs == "MM" or gs == "AM" or gs == " M" then
                                vim.cmd("silent !git add " .. node.absolute_path)

                                -- If the file is staged, we unstage
                            elseif gs == "M " or gs == "A " then
                                vim.cmd("silent !git restore --staged " .. node.absolute_path)
                            end

                            api.tree.reload()
                        end

                        FloatPreview.attach_nvimtree(bufnr)

                        local function opts(desc)
                            return {
                                desc = "nvim-tree: " .. desc,
                                buffer = bufnr,
                                noremap = true,
                                silent = true,
                                nowait = true,
                            }
                        end

                        vim.keymap.set("n", "<2-LeftMouse>", api.node.open.edit, opts("Open"))
                        vim.keymap.set("n", "<2-RightMouse>", api.tree.change_root_to_node, opts("CD"))

                        vim.keymap.set("n", ".", function(...)
                            local node = api.tree.get_node_under_cursor()
                            if node.type == "file" then
                                api.tree.change_root_to_node(node.parent)
                            else
                                api.tree.change_root_to_node(...)
                            end
                        end, opts("CD"))
                        vim.keymap.set("n", ",", api.tree.change_root_to_parent, opts("Up"))
                        local close_wrap = FloatPreview.close_wrap

                        vim.keymap.set("n", "<C-t>", close_wrap(api.node.open.tab), opts("Open: New Tab"))
                        vim.keymap.set("n", "<C-v>", close_wrap(api.node.open.vertical), opts("Open: Vertical Split"))
                        vim.keymap.set(
                            "n",
                            "<C-s>",
                            close_wrap(api.node.open.horizontal),
                            opts("Open: Horizontal Split")
                        )
                        vim.keymap.set("n", "<CR>", close_wrap(api.node.open.edit), opts("Open"))
                        vim.keymap.set("n", "<Tab>", close_wrap(api.node.open.preview), opts("Open"))
                        vim.keymap.set("n", "o", close_wrap(api.node.open.edit), opts("Open"))
                        vim.keymap.set(
                            "n",
                            "O",
                            close_wrap(api.node.open.no_window_picker),
                            opts("Open: No Window Picker")
                        )
                        vim.keymap.set("n", "a", close_wrap(api.fs.create), opts("Create"))
                        vim.keymap.set("n", "d", close_wrap(api.fs.remove), opts("Delete"))
                        vim.keymap.set("n", "r", close_wrap(api.fs.rename), opts("Rename"))
                        vim.keymap.set("n", "q", close_wrap(api.tree.close), opts("Close"))

                        vim.keymap.set("n", "ga", git_add, opts("Git Add"))
                    end,
                    hijack_cursor = true,
                    disable_netrw = true,
                    view = {
                        float = {
                            enable = true,
                            open_win_config = function()
                                local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
                                local window_w = 40
                                local window_h = screen_h - NVIM_TREE_HEIGHT_PADDING * 2
                                local center_x = NVIM_TREE_WIDTH_PADDING
                                local center_y = ((vim.opt.lines:get() - window_h) / 2) - vim.opt.cmdheight:get()

                                return {
                                    style = "minimal",
                                    relative = "editor",
                                    border = "single",
                                    row = center_y,
                                    col = center_x,
                                    width = window_w,
                                    height = window_h,
                                }
                            end,
                        },
                    },
                })
            end,
            lazy = true,
            keys = {
                {
                    "<Leader>fd",
                    mode = "n",
                    function()
                        require("nvim-tree.api").tree.open()
                    end,
                },
            },
        },

        -- lsp
        {
            "neovim/nvim-lspconfig",
            dependencies = { "hrsh7th/cmp-nvim-lsp" },
        },
        {
            "nvimdev/lspsaga.nvim",
            config = function()
                require("lspsaga").setup({})
            end,
            dependencies = {
                "nvim-tree/nvim-web-devicons",
                "nvim-treesitter/nvim-treesitter",
            },
        },

        {
            "nvimtools/none-ls.nvim",
            dependencies = "nvim-lua/plenary.nvim",
        },
        {
            "williamboman/mason.nvim",
            config = function()
                require("mason").setup({
                    ui = { border = "single" },
                })
            end,
            dependencies = { "williamboman/mason-lspconfig.nvim", "neovim/nvim-lspconfig" },
        },
        {
            "jay-babu/mason-null-ls.nvim",
            dependencies = { "williamboman/mason.nvim", "nvimtools/none-ls.nvim" },
            event = { "BufReadPre", "BufNewFile" },
            opts = {
                handlers = {},
            },
        },

        -- support satysfi
        {
            "sankantsu/satysfi.nvim",
            dependencies = {
                "neovim/nvim-lspconfig",
                "nvim-treesitter/nvim-treesitter",
            },
        },

        -- git
        "tpope/vim-fugitive",

        -- complete
        {
            "hrsh7th/nvim-cmp",
            dependencies = {
                { "onsails/lspkind.nvim", event = "InsertEnter" },
                { "hrsh7th/cmp-cmdline", event = "CmdlineEnter" },
                { "saadparwaiz1/cmp_luasnip", event = "InsertEnter" },
                { "hrsh7th/cmp-nvim-lsp", event = "InsertEnter" },
                { "hrsh7th/cmp-buffer", event = "InsertEnter" },
                { url = "https://codeberg.org/FelipeLema/cmp-async-path.git", event = "InsertEnter" },
                {
                    "L3MON4D3/LuaSnip",
                    version = "v2.3.0",
                    build = "make install_jsregexp",
                    event = "InsertEnter",
                },
                {
                    "windwp/nvim-autopairs",
                    config = true,
                },
            },
            lazy = true,
            event = { "InsertEnter", "CmdwinEnter", "CmdlineEnter" },
            config = function()
                local cmp = require("cmp")
                local cmp_autopairs = require("nvim-autopairs.completion.cmp")
                cmp.setup({
                    snippet = {
                        expand = function(args)
                            require("luasnip").lsp_expand(args.body)
                        end,
                    },
                    mapping = cmp.mapping.preset.insert({
                        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                        ["<C-f>"] = cmp.mapping.scroll_docs(4),
                        ["<C-Space>"] = cmp.mapping.complete(),
                        ["<C-e>"] = cmp.mapping.abort(),
                        ["<CR>"] = cmp.mapping.confirm({ select = false }),
                    }),
                    sources = cmp.config.sources({
                        { name = "nvim_lsp" },
                        { name = "luasnip" },
                    }, {
                        { name = "buffer" },
                    }),
                    window = {
                        completion = cmp.config.window.bordered(),
                        documentation = cmp.config.window.bordered(),
                    },
                    ---@diagnostic disable-next-line: missing-fields
                    formatting = {
                        format = require("lspkind").cmp_format({
                            mode = "symbol_text",
                            maxWidth = 50,
                            ellipses_char = "...",
                            show_labelDetails = true,
                        }),
                    },
                    preselect = cmp.PreselectMode.None,
                })
                cmp.setup.cmdline({ "/", "?" }, {
                    mapping = cmp.mapping.preset.cmdline(),
                    sources = {
                        { name = "buffer" },
                    },
                })
                cmp.setup.cmdline({ ":" }, {
                    mapping = cmp.mapping.preset.cmdline(),
                    sources = cmp.config.sources({
                        { name = "async_path" },
                    }, {
                        { name = "cmdline" },
                    }),
                    ---@diagnostic disable-next-line: missing-fields
                    matching = { disallow_symbol_nonprefix_matching = false },
                })
                cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
            end,
        },
        {
            "vim-skk/skkeleton",
            lazy = false,
            config = function()
                vim.keymap.set({"i","c","t"}, [[<C-j>]], [[<Plug>(skkeleton-enable)]], {noremap=false})

                vim.api.nvim_create_augroup("skkeleton_settings", {})
                vim.api.nvim_create_autocmd("User", {
                    group = "skkeleton_settings",
                    pattern = "skkeleton-initialize-pre",
                    callback = function()
                        vim.fn["skkeleton#config"]({
                            eggLikeNewline = true,
                            sources = {"skk_server"},
                            globalKanaTableFiles = { {"~/.config/skk_general/kana-rule.conf", "euc-jp"} },
--                            skkServerResEnc = "utf-8",
--                            skkServerReqEnc = "utf-8",
                        })
                        vim.fn.add(vim.g["skkeleton#mapped_keys"], ":")
                        vim.fn.add(vim.g["skkeleton#mapped_keys"], ";")
                        vim.fn.add(vim.g["skkeleton#mapped_keys"], "\"")
                        vim.fn["skkeleton#register_keymap"]("input", "`", "katakana")
                        vim.fn["skkeleton#register_keymap"]("input", "\"", "henkanPoint")
                    end
                })
                vim.api.nvim_create_autocmd({"InsertEnter", "CmdlineEnter"}, {
                    group = "skkeleton_settings",
                    callback = function() vim.fn["skkeleton#initialize"]() end
                })
                vim.api.nvim_create_autocmd("User", {
                    group = "skkeleton_settings",
                    pattern = "skkeleton-enable-post",
                    callback = function()
                        vim.keymap.set({"i", "c", "t"}, ":", function()
                                local state = vim.g["skkeleton#state"]
                                local mode = vim.fn["skkeleton#mode"]()
                                if mode ~= "abbrev" and state.phase == "input:okurinasi" then
                                    return [[<Cmd>call skkeleton#handle("handleKey", {"key": "\""})<CR>]]
                                    .. [[<Cmd>call skkeleton#handle("handleKey", {"key": ";"})<CR>]]
                                end
                                return [[<Cmd>call skkeleton#handle("handleKey", {"key": ":"})<CR>]]
                            end, {buffer = true, expr = true})
                    end
                })
                vim.api.nvim_create_autocmd("User", {
                    group = "skkeleton_settings",
                    pattern = "skkeleton-disable-post",
                    callback = function()
                        pcall(vim.keymap.del, {"i", "c", "t"}, ":", {buffer = true})
                    end
                })
            end,
            dependencies = { "vim-denops/denops.vim" }
        },
        {
            "delphinus/skkeleton_indicator.nvim",
            dependencies = { "vim-skk/skkeleton" },
            opts = {},
        },
    },
    checker = {
        enabled = true,
        notify = false,
    },
    git = {
        url_format = "git@github.com:%s.git",
    },
    rocks = {
        enabled = false,
    },
})
