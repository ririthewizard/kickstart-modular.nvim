return {
  {
    -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000, -- Make sure to load this before all the other start plugins.
    config = function()
      ---@diagnostic disable-next-line: missing-fields
      require('tokyonight').setup {
        transparent = true,
        styles = {
          comments = { italic = false }, -- Disable italics in comments
        },
      }

      -- Load the colorscheme here.
      -- Like many other themes, this one has different styles, and you could load
      -- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
      vim.cmd.colorscheme 'tokyonight'
    end,
  },
  {
    'rebelot/kanagawa.nvim',
    name = 'kanagawa',
    config = function()
      require('kanagawa').setup {
        transparent = true,
        terminal_colors = true,
        colors = {
          theme = {
            all = {
              ui = {
                bg_gutter = 'none',
              },
            },
          },
        },
        vim.cmd.colorscheme 'kanagawa',
      }
    end,
  },

  {
    'ribru17/bamboo.nvim',
    name = 'bamboo',
    config = function()
      require('bamboo').setup {
        transparent = true,
        term_colors = true,
      }
      vim.cmd.colorscheme 'bamboo'
    end,
  },

  {
    'rose-pine/neovim',
    name = 'rose-pine',
    config = function()
      require('rose-pine').setup {
        disable_background = true,
      }
      vim.cmd.colorscheme 'rose-pine'
    end,
  },
  {
    'comfysage/evergarden',
    name = 'evergarden',
    config = function()
      require('evergarden').setup {
        editor = {
          transparent_background = true,
          variant = 'hard',
        },
      }
      --vim.cmd.colorscheme 'evergarden'
    end,
  },
  {
    'samharju/synthweave.nvim',
    name = 'synthweave',
    config = function()
      require('synthweave').setup {
        transparent = true,
      }
      vim.cmd.colorscheme 'synthweave'
    end,
  },
  {
    'craftzdog/solarized-osaka.nvim',
    name = 'solarized-osaka',
    config = function()
      require('solarized-osaka').setup {
        transparent = true,
        terminal_colors = true,
      }
      vim.cmd.colorscheme 'solarized-osaka'
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
