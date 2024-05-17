return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/nvim-cmp",
        "j-hui/fidget.nvim",
        "folke/neodev.nvim",
    },

    config = function()
        require("neodev").setup({})
        require("fidget").setup({})
        require("mason").setup({})
        require("mason-lspconfig").setup({
            ensure_installed = {
                "gopls",
                "lua_ls",
                "pyright",
                "rust_analyzer",
            },
            handlers = {
                function(server_name)
                    require("lspconfig")[server_name].setup({})
                end,

                ["lua_ls"] = function()
                    local lspconfig = require("lspconfig")
                    lspconfig.lua_ls.setup({
                        settings = {
                            Lua = {
                                diagnostics = {
                                    globals = { "vim" }
                                },
                            },
                        },
                    })
                end,
                ["solargraph"] = function ()
                    local lspconfig = require("lspconfig")
                    lspconfig.solargraph.setup({
                        root_dir = lspconfig.util.root_pattern("Gemfile", ".git", "."),
                    })
                end,
                ["rubocop"] = function()
                    local lspconfig = require("lspconfig")
                    lspconfig.rubocop.setup({
                        root_dir = lspconfig.util.root_pattern("Gemfile", ".git", "."),
                    })
                end,
            },
        })
    end
}
