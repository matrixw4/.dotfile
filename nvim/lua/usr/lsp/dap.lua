return function()
  local keymap = vim.keymap.set

  local dap = require('dap')
  local dapui = require('dapui')

  require('mason-nvim-dap').setup({
    automatic_setup = true,
    handlers = {},
    ensure_installed = {
      'delve',
    },
  })
  keymap('n', '<F5>', dap.continue, { desc = 'Debug: Start/Continue' })
  keymap('n', '<F1>', dap.step_into, { desc = 'Debug: Step Into' })
  keymap('n', '<F2>', dap.step_over, { desc = 'Debug: Step Over' })
  keymap('n', '<F3>', dap.step_out, { desc = 'Debug: Step Out' })
  keymap(
    'n',
    '<leader>b',
    dap.toggle_breakpoint,
    { desc = 'Debug: Toggle Breakpoint' }
  )
  keymap('n', '<leader>B', function()
    dap.set_breakpoint(vim.fn.input('Breakpoint condition: '))
  end, { desc = 'Debug: Set Breakpoint' })

  -- Dap UI setup
  dapui.setup({
    icons = { expanded = '▾', collapsed = '▸', current_frame = '*' },
    controls = {
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

  keymap(
    'n',
    '<F7>',
    dapui.toggle,
    { desc = 'Debug: See last session result.' }
  )

  dap.listeners.after.event_initialized['dapui_config'] = dapui.open
  dap.listeners.before.event_terminated['dapui_config'] = dapui.close
  dap.listeners.before.event_exited['dapui_config'] = dapui.close

  -- Install golang specific config
  require('dap-go').setup()
end
