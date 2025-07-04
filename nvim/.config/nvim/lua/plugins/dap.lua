return {
  {
    'mfussenegger/nvim-dap',
    enabled = false,
    dependencies = {
      'jay-babu/mason-nvim-dap.nvim',
      'leoluz/nvim-dap-go',
      'nvim-neotest/nvim-nio',
      'rcarriga/nvim-dap-ui',
      'williamboman/mason.nvim',
    },
    config = function()
      local dap = require('dap')
      local dapui = require('dapui')

      require('mason-nvim-dap').setup({
        -- Makes a best effort to setup the various debuggers with
        -- reasonable debug configurations
        automatic_installation = true,

        -- You can provide additional configuration to the handlers,
        -- see mason-nvim-dap README for more information
        handlers = {},

        -- You'll need to check that you have the required things installed
        -- online, please don't ask me how to install them :)
        ensure_installed = {
          -- Update this to ensure that you have the debuggers for the langs you want
          'delve',
        },
      })

      -- Basic debugging keymaps, feel free to change to your liking!
      vim.keymap.set('n', '<F5>', dap.continue, { desc = 'Debug: Start/Continue' })
      vim.keymap.set('n', '<F1>', dap.step_into, { desc = 'Debug: Step Into' })
      vim.keymap.set('n', '<F2>', dap.step_over, { desc = 'Debug: Step Over' })
      vim.keymap.set('n', '<F3>', dap.step_out, { desc = 'Debug: Step Out' })
      vim.keymap.set('n', '<leader>cb', dap.toggle_breakpoint, { desc = 'Debug: Toggle [C]ode [B]reakpoint' })
      vim.keymap.set('n', '<leader>cB', function() dap.set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, { desc = 'Debug: Set [C]ode [B]reakpoint' })

      -- Dap UI setup
      -- For more information, see |:help nvim-dap-ui|

      dapui.setup({ ---@diagnostic disable-line: missing-fields
        -- Set icons to characters that are more likely to work in every terminal.
        --    Feel free to remove or use ones that you like more! :)
        --    Don't feel like these are good choices.
        icons = { expanded = '▾', collapsed = '▸', current_frame = '*' },
        controls = { ---@diagnostic disable-line: missing-fields
          icons = {
            pause = '⏸',
            play = '▶',
            step_into = '⏎',
            step_over = '⏭',
            step_out = '⏮',
            step_back = 'b',
            run_last = '▶▶',
            terminate = '⏹',
            disconnect = '⏏',
          },
        },
      })

      -- Toggle to see last session result. Without this, you can't see session output in case of unhandled exception.
      vim.keymap.set('n', '<F7>', dapui.toggle, { desc = 'Debug: See last session result.' })

      dap.listeners.after.event_initialized['dapui_config'] = dapui.open
      dap.listeners.before.event_terminated['dapui_config'] = dapui.close
      dap.listeners.before.event_exited['dapui_config'] = dapui.close

      -- Install golang specific config
      require('dap-go').setup({
        delve = {
          -- On Windows delve must be run attached or it crashes.
          -- See https://github.com/leoluz/nvim-dap-go/blob/main/README.md#configuring
          detached = vim.fn.has('win32') == 0,
        },
      })
    end,
  },
}
