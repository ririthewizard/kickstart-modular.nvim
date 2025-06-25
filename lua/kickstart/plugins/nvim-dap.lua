return {
  {
    'mfussenegger/nvim-dap',
    dependencies = {
      'leoluz/nvim-dap-go',
      'rcarriga/nvim-dap-ui',
      'nvim-neotest/nvim-nio',
      'theHamsta/nvim-dap-virtual-text',
      'jay-babu/mason-nvim-dap.nvim',
    },

    config = function()
      local mason_dap = require 'mason-nvim-dap'
      local dap = require 'dap'
      local ui = require 'dapui'
      local dap_virtual_text = require 'nvim-dap-virtual-text'

      dap_virtual_text.setup()

      mason_dap.setup {
        ensure_installed = { 'netcoredbg' },
        automatic_installion = true,
        handlers = {
          function(config)
            require('mason-nvim-dap').default_setup(config)
          end,
        },
      }

      local netcoredbg = vim.fn.exepath 'netcoredbg'
      dap.adapters.coreclr = {
        type = 'executable',
        command = netcoredbg,
        args = { '--interpreter=vscode' },
      }

      dap.configurations.cs = {
        {
          type = 'coreclr',
          name = 'launch - netcoredbg',
          request = 'launch',
          program = function()
            return vim.fn.input('Path to dll', vim.fn.getcwd() .. '/bin/Debug/', 'file')
          end,
        },
      }

      ui.setup()

      vim.fn.sign_define('DapBreakpoint', { text = '🐞' })

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
    keys = {
      {
        '<leader>d',
        group = 'Debugger',
        nowait = true,
        remap = false,
      },
      {
        '<leader>dt',
        function()
          require('dap').toggle_breakpoint()
        end,
        desc = 'Toggle Breakpoint',
        nowait = true,
        remap = false,
      },
      {
        '<leader>dc',
        function()
          require('dap').continue()
        end,
        desc = 'Continue',
        nowait = true,
        remap = false,
      },
      {
        '<leader>di',
        function()
          require('dap').step_into()
        end,
        desc = 'Step Into',
        nowait = true,
        remap = false,
      },
      {
        '<leader>do',
        function()
          require('dap').step_over()
        end,
        desc = 'Step Over',
        nowait = true,
        remap = false,
      },
      {
        '<leader>dO',
        function()
          require('dap').step_out()
        end,
        desc = 'Step Out',
        nowait = true,
        remap = false,
      },
      {
        '<leader>dr',
        function()
          require('dap').repl.open()
        end,
        desc = 'Open REPL',
        nowait = true,
        remap = false,
      },
      {
        '<leader>dl',
        function()
          require('dap').run_last()
        end,
        desc = 'Run Last',
        nowait = true,
        remap = false,
      },
      {
        '<leader>dq',
        function()
          require('dap').terminate()
          require('dapui').close()
          require('nvim-dap-virtual-text').toggle()
        end,
        desc = 'Terminate',
        nowait = true,
        remap = false,
      },
    },
  },
}
