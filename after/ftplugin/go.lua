vim.keymap.set("n", "<leader>td", function()
  require("dap-go").debug_test()
end, { buffer = 0 })

vim.keymap.set("n", "<leader>ee", "oif err != nil {<CR>}<Esc>Oreturn err<Esc>", { buffer = 0 })
