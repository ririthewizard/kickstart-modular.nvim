require("config.lsp.lsp")
require("config.colors.rosepine")
require("config.treesitter")
require("config.telescope")

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.g.have_nerd_font = true

vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" })

vim.opt_local.conceallevel = 2


-- Basic settings
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.wrap = false
vim.opt.scrolloff = 9

-- Indentation
vim.opt.shiftwidth = 4
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.breakindent = true

-- Search settings
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- Visual settings
vim.opt.termguicolors = true
vim.opt.showmatch = true
vim.opt.matchtime = 2
vim.opt.cmdheight = 2
vim.opt.completeopt = "menuone,noinsert,noselect"
vim.opt.showmode = false
vim.opt.pumheight = 10
vim.opt.pumblend = 10
vim.opt.winblend = 0
vim.opt.conceallevel = 0
vim.opt.concealcursor = ""
vim.opt.lazyredraw = true
vim.opt.splitright = true
vim.opt.splitbelow = true

-- File handling
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.undodir = vim.fn.expand("~/.nvim/undodir")
vim.opt.updatetime = 300
vim.opt.timeoutlen = 500
vim.opt.autoread = true
vim.opt.autowrite = false

-- Behavior settings
vim.opt.errorbells = false
vim.opt.backspace = "indent,eol,start"
vim.opt.autochdir = false
vim.opt.iskeyword:append("-")
vim.opt.path:append("**")
vim.opt.selection = "exclusive"
vim.opt.mouse = "a"
vim.opt.clipboard:append("unnamedplus")
vim.opt.encoding = "UTF-8"
vim.opt.inccommand = "split"
vim.opt.list = true
vim.opt.listchars = { tab = "» " }

-- ==================================
-- Keymaps
-- ==================================

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open Diagnostic [Q]uickfix list" })

vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv'", { desc = "Move highlighted line(s) down" })
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv'", { desc = "Move highlighted line(s) up" })

vim.keymap.set("x", "<leader>p", "'_dP'", { desc = "Paste without overriding what's in your paste buffer" })

vim.keymap.set("n", "<leader>ec", ":e ~/.config/nvim/init.lua<CR>", { desc = "[E]dit [C]onfig" })

vim.keymap.set("n", "<leader>pa", function()
    local path = vim.fn.expand("%:p")
    vim.fn.setreg("+", path)
    print("file:", path)
end, { desc = "Copies file [p]ath" })

vim.keymap.set("n", "<leader>cs", function()
    vim.fn.execute(":Telescope colorscheme", "silent")
end, { desc = "Change the color scheme" })

-- Reminders
vim.keymap.set("n", "<left>", "<cmd>echo 'Use h to move!!!'<CR>")
vim.keymap.set("n", "<right>", "<cmd>echo 'Use l to move!!!'<CR>")
vim.keymap.set("n", "<up>", "<cmd>echo 'Use k to move!!!'<CR>")
vim.keymap.set("n", "<down>", "<cmd>echo 'Use j to move!!!'<CR>")

-- Buffer movement
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window"})
vim.keymap.set("n", "<C-h>", "<C-w><C-l>", { desc = "Move focus to the right window"})
vim.keymap.set("n", "<C-h>", "<C-w><C-k>", { desc = "Move focus to the upper window"})
vim.keymap.set("n", "<C-h>", "<C-w><C-j>", { desc = "Move focus to the lower window"})

-- Config file specifics
vim.keymap.set("n", "<leader><leader>x", "<cmd>source %<CR>", { desc = "Source entire file" })
vim.keymap.set("n", "<leader>x", ":.lua<CR>")
vim.keymap.set("v", "<leader>x", ":lua<CR>")

vim.keymap.set("n", "<M-j>", "<cmd>cnext<CR>")
vim.keymap.set("n", "<M-k>", "<cmd>cprev<CR>")

-- Visual QOL
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Half page down (centered)" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Half page up (centered)" })
vim.keymap.set("n", "n", "nzzzv", { desc = "Next search result (centered)" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous search result (centered)" })

-- Buffer navigation
vim.keymap.set("n", "<leader>bn", ":bnext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<leader>bp", ":bprevious<CR>", { desc = "Previous buffer" })

-- Splitting and resizing
vim.keymap.set("n", "<C-Up>", ":resize +2<CR>", { desc = "Increase window height" })
vim.keymap.set("n", "<C-Down>", ":resize -2<CR>", { desc = "Decrease window height" })
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Decrease window width" })
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Increase window width" })

-- Quick file navigation
vim.keymap.set("n", "<leader>e", ":Explore<CR>", { desc = "Opens NetRW" })
vim.keymap.set("n", "<leader>ff", ":find ", { desc = "[F]ind File" })

-- Command-line completion
vim.opt.wildmenu = true
vim.opt.wildmode = "longest:full,full"
vim.opt.wildignore:append({ "*.o", "*.obj", "*.pyc", "*.class", "*.jar" })

-- Performance improvements
vim.opt.redrawtime = 10000
vim.opt.maxmempattern = 20000

-- Autocommands

local augroup = vim.api.nvim_create_augroup("UserConfig", {})

vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highling when yanking text",
    group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
    callback = function()
	vim.hl.on_yank()
    end,
})

vim.api.nvim_create_autocmd("BufReadPost", {
    desc = "Return to last edit position on file open",
    group = augroup,
    callback = function()
	local mark = vim.api.nvim_buf_get_mark(0, '"')
	local lcount = vim.api.nvim_buf_line_count(0)
	if mark[1] > 0 and mark[1] <= lcount then
	    pcall(vim.api.nvim_win_set_cursor, 0, mark)
	end
    end,
})

vim.api.nvim_create_autocmd("VimResized", {
    desc = "Resize splits when window is resized",
    group = augroup,
    callback = function()
	vim.cmd("tabdo wincmd =")
    end,
})

-- ====================================================
-- Status Line
-- ====================================================

-- Git branch function
local function git_branch()
    local branch = vim.fn.system("git branch --show-current 2>/dev/null | tr -d '\n'")
    if branch ~= "" then
	return " " .. branch .. " "
    end
    return ""
end

-- File type with indicators
local function file_type()
    local ft = vim.bo.filetype
    local icons = {
	lua = "[LUA]",
	python = "[PY]",
	javascript = "[JS]",
	html = "[HTML]",
	css = "[CSS]",
	json = "[JSON]",
	markdown = "[MD]",
	go = "[GO]",
	sh = "[SH]",
    }

    if ft == "" then
	return " "
    end

    return (icons[ft] or ft)
end

-- LSP status
local function lsp_status()
    local clients = vim.lsp.get_clients({ bufnr = 0 })
    if #clients > 0 then
	return " LSP"
    end
    return ""
end

-- Word count for text files
local function word_count()
    local ft = vim.bo.filetype
    if ft == "markdown" or ft == "text" or ft == "tex" then
	local words = vim.fn.wordcount().words
	return " " .. words .. " words"
    end
    return ""
end

-- File size
local function file_size()
    local size = vim.fn.getfsize(vim.fn.expand("%"))
    if size < 0 then return "" end
    if size < 1024 then
	return size .. " B"
    elseif size < 1024 * 1024 then
	return string.format("%.1fK", size / 1024)
    else
	return string.format("%.1fM", size / 1024 / 1024)
    end
end

-- Mode indicators
local function mode_icon()
    local mode = vim.fn.mode()
    local modes = {
	n = "NORMAL",
	i = "INSERT",
	v = "VISUAL",
	V = "V-LINE",
	["\22"] = "V-BLOCK", -- <C-v>
	c = "COMMAND",
	s = "SELECT",
	S = "S-LINE",
	["\19"] = "S-BLOCK", -- <C-s>
	R = "REPLACE",
	r = "REPLACE",
	["!"] = "SHELL",
	t = "TERMINAL"
    }
    return modes[mode] or " " .. mode:upper()
end

_G.mode_icon = mode_icon
_G.git_branch = git_branch
_G.file_type = file_type
_G.file_size = file_size
_G.lsp_status = lsp_status


vim.cmd([[
    highlight StatusLineBold gui=bold cterm=bold
]])

-- Function to change status line based on window focus
local function setup_dynamic_statusline()
    vim.api.nvim_create_autocmd({"WinEnter", "BufEnter"}, {
	callback = function()
	    vim.opt_local.statusline = table.concat {
		" ",
		"%#StatusLineBold#",
		"%{v:lua.mode_icon()}",
		"%#StatusLine#",
		" | %f %h%m%r",
		"%{v:lua.git_branch()}",
		" | ",
		"%{v:lua.file_type()}",
		" | ",
		"%{v:lua.file_size()}",
		" | ",
		"%{v:lua.lsp_status()}",
		"%=",                    -- Right-align everything after this
		"%l:%c  %P",             -- Line:Column and Percentage
	    }
	end
    })
    vim.api.nvim_set_hl(0, "StatusLineBold", { bold = true })

    vim.api.nvim_create_autocmd({"WinLeave", "BufLeave"}, {
	callback = function()
	    vim.opt_local.statusline = " %f %h%m%r | %{v:lua.file_type()} | %= %l:%c  %P"
	end
    })
end

setup_dynamic_statusline()
