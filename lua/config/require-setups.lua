-- Load Mason and Mason-LSPConfig
local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")
local lspconfig = require("lspconfig")

-- Define servers you want to ensure are installed
local servers = { "lua_ls", "jsonls", "ts_ls" } -- Updated to use "ts_ls"

-- Mason setup with UI customizations
mason.setup({
    ui = {
        border = "rounded", -- Adds rounded borders to the Mason UI
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        },
    },
})

-- Mason-LSPConfig setup to ensure servers are installed on startup
mason_lspconfig.setup({
    ensure_installed = servers, -- Updated to include "ts_ls"
    automatic_installation = true, -- Automatically install servers if not present
})

-- LSP Configurations for each server
lspconfig.lua_ls.setup({
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" },
            },
        },
    },
})
lspconfig.jsonls.setup({})
lspconfig.ts_ls.setup({}) -- Updated to use "ts_ls" consistently

-- Autocommand to trigger additional setup on `BufRead`, if needed
vim.api.nvim_create_autocmd("BufRead", {
    pattern = "*",
    callback = function()
        for _, server in ipairs(servers) do
            if lspconfig[server] then
                lspconfig[server].setup({})
            end
        end
    end,
})

-- Harpoon Setup
local harpoon = require("harpoon")
harpoon:setup() -- Required setup for Harpoon

-- Key mappings for Harpoon
vim.keymap.set("n", "<leader>a", function()
    harpoon.list():add()
end)
vim.keymap.set("n", "<A-u>", function()
    harpoon.ui:toggle_quick_menu(harpoon:list())
end)

-- Oil setup
require("oil").setup()

-- Tailwind Tools setup
require("tailwind-tools").setup({})

-- Commented Nvim-tree setup
--[[
require("nvim-tree").setup({
    sort = {
        sorter = "case_sensitive",
    },
    view = {
        width = 30,
    },
    renderer = {
        group_empty = true,
    },
    filters = {
        dotfiles = true,
    },
})
]]
