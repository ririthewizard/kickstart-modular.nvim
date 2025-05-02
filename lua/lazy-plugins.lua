require('lazy').setup({
  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically
  {
    'mbbill/undotree',

    vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle),
  },
  'folke/zen-mode.nvim',
  'ThePrimeagen/vim-be-good',
  'xzbdmw/colorful-menu.nvim',
  {
    'Weyaaron/nvim-training',
    pin = true,
  },

  require 'kickstart/plugins/gitsigns',

  require 'kickstart/plugins/which-key',

  require 'kickstart/plugins/telescope',

  require 'kickstart/plugins/lspconfig',

  require 'kickstart/plugins/conform',

  require 'kickstart/plugins/cmp',

  require 'kickstart/plugins/todo-comments',

  require 'kickstart/plugins/mini',

  require 'kickstart/plugins/treesitter',

  require 'kickstart.plugins.autopairs',

  require 'kickstart.plugins.colorschemes',

  require 'kickstart.plugins.cloak',

  --{ import = 'custom.plugins' },
}, {
  ui = {
    -- If you are using a Nerd Font: set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
    icons = {},
  },
})

-- vim: ts=2 sts=2 sw=2 et
