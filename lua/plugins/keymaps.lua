-- ==================================
-- Keymaps
-- ==================================

vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open Diagnostic [Q]uickfix list' })

vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv'", { desc = 'Move highlighted line(s) down' })
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv'", { desc = 'Move highlighted line(s) up' })

vim.keymap.set('x', '<leader>p', "'_dP'", { desc = "Paste without overriding what's in your paste buffer" })

vim.keymap.set('n', '<leader>ec', ':e ~/.config/nvim/<CR>', { desc = '[E]dit [C]onfig' })

vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format, { desc = '[L}SP buffer [F]ormat' })

vim.keymap.set('n', '<leader>pa', function()
  local path = vim.fn.expand '%:p'
  vim.fn.setreg('+', path)
  print('file:', path)
end, { desc = 'Copies file [p]ath' })

vim.keymap.set('n', '<leader>cs', function()
  vim.fn.execute(':Telescope colorscheme', 'silent')
end, { desc = 'Change the color scheme' })

-- Reminders
vim.keymap.set('n', '<left>', "<cmd>echo 'Use h to move!!!'<CR>")
vim.keymap.set('n', '<right>', "<cmd>echo 'Use l to move!!!'<CR>")
vim.keymap.set('n', '<up>', "<cmd>echo 'Use k to move!!!'<CR>")
vim.keymap.set('n', '<down>', "<cmd>echo 'Use j to move!!!'<CR>")

-- Buffer movement
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })

-- Config file specifics
vim.keymap.set('n', '<leader><leader>x', '<cmd>source %<CR>', { desc = 'Source entire file' })
vim.keymap.set('n', '<leader>x', ':.lua<CR>')
vim.keymap.set('v', '<leader>x', ':lua<CR>')

vim.keymap.set('n', '<M-j>', '<cmd>cnext<CR>')
vim.keymap.set('n', '<M-k>', '<cmd>cprev<CR>')

vim.keymap.set('n', '<leader>ps', '<cmd>lua vim.pack.update()<CR>', { desc = 'Updates plugins (write to confirm, quit to discard' })

-- Visual QOL
vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'Half page down (centered)' })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'Half page up (centered)' })
vim.keymap.set('n', 'n', 'nzzzv', { desc = 'Next search result (centered)' })
vim.keymap.set('n', 'N', 'Nzzzv', { desc = 'Previous search result (centered)' })

-- Buffer navigation
vim.keymap.set('n', '<leader>bn', ':bnext<CR>', { desc = 'Next buffer' })
vim.keymap.set('n', '<leader>bp', ':bprevious<CR>', { desc = 'Previous buffer' })

-- Splitting and resizing
vim.keymap.set('n', '<C-Up>', ':resize +2<CR>', { desc = 'Increase window height' })
vim.keymap.set('n', '<C-Down>', ':resize -2<CR>', { desc = 'Decrease window height' })
vim.keymap.set('n', '<C-Left>', ':vertical resize -2<CR>', { desc = 'Decrease window width' })
vim.keymap.set('n', '<C-Right>', ':vertical resize +2<CR>', { desc = 'Increase window width' })

-- Quick file navigation
vim.keymap.set('n', '<leader>e', ':Explore<CR>', { desc = 'Opens NetRW' })
vim.keymap.set('n', '<leader>ff', ':find ', { desc = '[F]ind File' })

-- Command-line completion
vim.opt.wildmenu = true
vim.opt.wildmode = 'longest:full,full'
vim.opt.wildignore:append { '*.o', '*.obj', '*.pyc', '*.class', '*.jar' }

-- Performance improvements
vim.opt.redrawtime = 10000
vim.opt.maxmempattern = 20000

-- Telescope Keymaps
local builtin = require 'telescope.builtin'
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = '[F]ind [H]elp' })
vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = '[F]ind [F]iles' })
vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = '[F]ind by [G]rep' })
vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })

vim.keymap.set('n', '<leader>/', function()
  builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer' })

vim.keymap.set('n', '<leader>s/', function()
  builtin.live_grep {
    grep_open_files = true,
    prompt_title = 'Live Grep in Open Files',
  }
end, { desc = '[/] Live Grep in Open Files' })

vim.keymap.set('n', '<leader>ec', function()
  builtin.find_files { cwd = vim.fn.stdpath 'config' }
end, { desc = '[E]dit [C]onfig' })

-- Undo Tree
vim.keymap.set('n', '<leader>U', vim.cmd.UndotreeToggle)
