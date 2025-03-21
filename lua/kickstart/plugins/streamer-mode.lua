return {
  {
    'Kolkhis/streamer-mode.nvim',
    config = function()
      require('streamer-mode').setup()

      vim.keymap.set('n', '<leader>sm', '<cmd>SM<CR>', { silent = true, desc = '[S]treamer [M]ode on' })
      vim.keymap.set('n', '<leader>sms', '<cmd>SMsoft<CR>', { silent = true, desc = '[S]treamer [M]ode [S]oft' })
      vim.keymap.set('n', '<leader>smo', '<cmd>SMoff<CR>', { silent = true, desc = '[S]treamer [M]ode [O]ff' })
    end,
  },
}
