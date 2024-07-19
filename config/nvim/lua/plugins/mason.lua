---@type LazySpec
---@diagnostic disable-next-line: missing-fields
return {
    "williamboman/mason.nvim",
    cmd = { "Mason", "MasonLog", "MasonUpdate", "MasonInstall", "MasonUninstall", "MasonUninstallAll" },
    ---@type MasonSettings
    opts = {
        ui = {
            border = "single",
        },
    },
}
