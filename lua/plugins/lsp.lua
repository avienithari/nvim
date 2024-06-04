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
    "stevearc/conform.nvim",
  },

  config = function()
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    require("neodev").setup({})
    require("fidget").setup({})
    require("mason").setup({})
    require("mason-lspconfig").setup({
      ensure_installed = {
        "clangd",
        "lua_ls",
        "gopls",
        "golangci_lint_ls",
        "pyright",
        "rust_analyzer",
        "solargraph",
        "tsserver",
        "vimls",
        "zls",
      },
      handlers = {
        function(server_name)
          require("lspconfig")[server_name].setup({
            capabilities = capabilities,
          })
        end,

        ["lua_ls"] = function()
          local lspconfig = require("lspconfig")
          lspconfig.lua_ls.setup({
            settings = {
              Lua = {
                diagnostics = {
                  globals = { "vim" },
                },
              },
            },
          })
        end,
      },
    })
    require("conform").setup({
      formatters_by_ft = {
        lua = { "stylua" },
      },
    })
    vim.api.nvim_create_autocmd("BufWritePre", {
      callback = function(args)
        require("conform").format({
          bufnr = args.buf,
          lsp_fallback = true,
          quiet = true,
        })
      end,
    })
  end,
}
