return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "leoluz/nvim-dap-go",
    "mfussenegger/nvim-dap-python",
    "rcarriga/nvim-dap-ui",
    "nvim-neotest/nvim-nio",
    "theHamsta/nvim-dap-virtual-text",
    "williamboman/mason.nvim",
  },
  config = function()
    local dap = require("dap")
    local ui = require("dapui")
    local python_env_path = "~/code/python/.envs/debugpy/bin/python"

    require("dapui").setup()
    require("nvim-dap-virtual-text").setup()

    require("dap-go").setup()
    require("dap-python").setup(python_env_path)

    vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint)
    vim.keymap.set("n", "<leader>gb", dap.run_to_cursor)

    -- Eval under cursor
    vim.keymap.set("n", "<leader>?", function()
      require("dapui").eval(nil, { enter = true })
    end)

    vim.keymap.set("n", "<F1>", dap.continue)
    vim.keymap.set("n", "<F2>", dap.step_into)
    vim.keymap.set("n", "<F3>", dap.step_over)
    vim.keymap.set("n", "<F4>", dap.step_out)
    vim.keymap.set("n", "<F5>", dap.step_back)
    vim.keymap.set("n", "<F12>", dap.restart)

    dap.listeners.before.attach.dapui_config = function()
      ui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
      ui.open()
    end
    dap.listeners.before.event_terminated.dapui_config = function()
      ui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function()
      ui.close()
    end
  end,
}
