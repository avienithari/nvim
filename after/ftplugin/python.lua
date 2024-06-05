vim.keymap.set("n", "<leader>td", function()
  require("dap-python").test_method()
end, { buffer = 0 })
