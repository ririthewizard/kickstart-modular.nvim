return {
  {
    'epwalsh/obsidian.nvim',
    version = '*', -- recommended, use latest release instead of latest commit
    lazy = true,
    ft = 'markdown',
    -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
    -- event = {
    --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
    --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
    --   -- refer to `:h file-pattern` for more examples
    --   "BufReadPre path/to/my-vault/*.md",
    --   "BufNewFile path/to/my-vault/*.md",
    -- },
    dependencies = {
      -- Required.
      'nvim-lua/plenary.nvim',
      'hrsh7th/nvim-cmp',
      'nvim-telescope/telescope.nvim',
      'nvim-treesitter',

      -- see below for full list of optional dependencies 👇
    },
    opts = {
      dir = '~/Desktop/Obsidian/Things and Stuff/',

      completion = {
        nvim_cmp = true,
        min_chars = 3,
      },

      ---@param title string|?
      ---@return string
      note_id_func = function(title)
        local suffix = ''
        if title ~= nil then
          suffix = title:gsub(' ', '-'):lower()
        else
          for _ = 1, 4 do
            suffix = 'Inbox' .. string.char(math.random(69, 94))
          end
        end
        return suffix
      end,

      templates = {
        folder = '~/Desktop/Obsidian/Things And Stuff/Templates/',
        date_format = '%Y-%m-%d-%a',
        time_format = '%H:%M',
      },

      preferred_link_style = 'markdown',
    },
  },
}
