vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

vim.keymap.set('n', '<space><space>x', '<cmd>source %<CR>', { desc = 'Source entire file ' })
vim.keymap.set('n', '<space>x', ':.lua<CR>')
vim.keymap.set('v', '<space>x', ':lua<CR>')

vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv'")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv'")

vim.keymap.set('n', '<M-j>', '<cmd>cnext<CR>')
vim.keymap.set('n', '<M-k>', '<cmd>cprev<CR>')

vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')

vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

vim.keymap.set('x', '<leader>p', '"_dP')

-- vim.opt.undodir = os.getenv 'HOME' .. './nvim/undodir'
vim.opt.undofile = true

vim.keymap.set('n', '<leader>cs', function()
  vim.fn.execute(':Telescope colorscheme', 'silent')
end, { desc = 'Change the color scheme' })

local job_id = 0
vim.keymap.set('n', '<space>st', function()
  vim.cmd.vnew()
  vim.cmd.term()
  vim.cmd.wincmd 'J'
  vim.api.nvim_win_set_height(0, 13)

  job_id = vim.bo.channel
end)

vim.keymap.set('n', '<space>ga', function()
  vim.fn.chansend(job_id, { 'git add .\r\n' })
end)

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.api.nvim_create_autocmd('TermOpen', {
  group = vim.api.nvim_create_augroup('custom-term-open', { clear = true }),
  callback = function()
    vim.opt.number = false
    vim.opt.relativenumber = false
  end,
})

-- vim: ts=2 sts=2 sw=2 et
