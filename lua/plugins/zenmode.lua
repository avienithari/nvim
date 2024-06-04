return {
  "folke/zen-mode.nvim",
  keys = {
    { "<leader>Z", "<cmd>ZenMode<CR>" },
  },
  config = function()
    vim.keymap.set("n", "<leader>Z", function()
      require("zen-mode").setup({
        window = { width = 100 },
        plugins = {
          options = { laststatus = 3 },
        },
      })
      require("zen-mode").toggle()
      vim.wo.wrap = false
      vim.wo.number = true
      vim.wo.rnu = true
    end)
  end,
}
