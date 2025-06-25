return {
  {
    'mfussenneger/nvim-dap',
    dependencies = {
      'leoluz/nvim-dap-go',
      'rcarriga/nvim-dap-ui',
      'nvim-neotest/nvim-nio',
      'theHamsta/nvim-dap-virtual-text',
      'williamboman/mason.nvim',
    },

    config = function()
      local dap = require 'dap'
      local ui = require 'dapui'
    end,
  },
}
