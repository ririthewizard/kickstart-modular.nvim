-- ============================
-- Mason
-- ============================
vim.pack.add {
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/mason-org/mason-lspconfig.nvim" },
	{ src = "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim" },
}

require("mason").setup()
require("mason-lspconfig").setup()
require("mason-tool-installer").setup({
	ensure_installed = {
		"lua_ls",
		"stylua",
		"blue",
		"clangd",
		"csharp_ls",
		"gopls",
		"jdtls",
		"html",
		"markdown_oxide",
		"netcoredbg",
		"oxlint",
		"prettierd",
		"pyright",
		"sith-language-server",
	}
})

-- ===============================
-- Color scheme
-- ===============================
vim.pack.add({
	{ src = "https://github.com/rose-pine/neovim" },
	{ src = "" }
})

require("rose-pine").setup({
	styles = {
		transparency = true,
	},
})

vim.cmd [[colorscheme rose-pine]]

-- ===============================
-- Telescope
-- ===============================
vim.pack.add {
	{ src = "https://github.com/nvim-telescope/telescope.nvim" },
	{ src = "https://github.com/nvim-lua/plenary.nvim" },
	{ src = "https://github.com/nvim-telescope/telescope-fzf-native.nvim", build = "make",
		cond = function()
			return vim.fn.executable "make" == 1
		end,
	},
	{ src = "https://github.com/nvim-telescope/telescope-ui-select.nvim" },
	{ src = "https://github.com/nvim-tree/nvim-web-devicons",            enabled = vim.g.have_nerd_font }
}

require("telescope").setup({
	pickers = {
		find_files = {
			theme = "ivy",
		},
	},
	extensions = {
		fzf = {},
	},
})

pcall(require("telescope").load_extension, "fzf")
pcall(require("telescope").load_extension, "ui-select")


-- ===============================
-- Treesitter
-- ===============================
vim.pack.add({
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "master" }
})

require 'nvim-treesitter.configs'.setup({
	-- A list of parser names, or "all" (the listed parsers MUST always be installed)
	ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline", "html", "java", "javascript", "go", "python" },

	-- Automatically install missing parsers when entering buffer
	-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
	auto_install = true,
	modules = {},
	ignore_install = {},

	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
	indent = {
		enable = true,
	},
})

vim.api.nvim_create_autocmd("PackChanged", {
	desc = "Handle nvim-treesitter updates",
	group = vim.api.nvim_create_augroup("nvim-treesitter-pack-changed-update-handler", { clear = true }),
	callback = function(event)
		if event.data.kind == "update" then
			vim.notify("nvim-treesitter updated, running TSUpdate...", vim.log.levels.INFO)
			--@diagnostic disable-next-line: param-type-mismatch
			local ok = pcall(vim.cmd, "TSUpdate")
			if ok then
				vim.notify("TSUpdate completed successfully!", vim.log.levels.INFO)
			else
				vim.notify("TSUpdate command not available yet, skipping", vim.log.levels.INFO)
			end
		end
	end,
})

-- ===============================
-- Miscellaneous
-- ===============================
vim.pack.add { "https://github.com/mbbill/undotree" }

vim.keymap.set("n", "<leader>U", vim.cmd.UndotreeToggle)


-- ===============================
-- Obsidian
-- ===============================
vim.pack.add({
	{ src = "https://github.com/epwalsh/obsidian.nvim", version = "main" }
})

require "obsidian".setup({
	ft = "markdown",
	workspaces = {
		{
			name = "personal",
			path = "~/Desktop/Obsidian/Things and Stuff/",
		}
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
		"nvim-treesitter",
	},

	---@param title string|?
	---@return string
	note_id_func = function(title)
		local suffix = ""
		if title ~= nil then
			suffix = title:gsub(" ", "-"):lower()
		else
			for _ = 1, 4 do
				suffix = "Inbox" .. string.char(math.random(96, 94))
			end
		end
		return suffix
	end,

	templates = {
		folder = "~/Desktop/Obsidian/Things and Stuff/Templates/",
		date_format = "%Y-%m-%d-%a",
		time_format = "%H:%M",
	},

	preferred_link_style = "markdown",
})

-- ===============================
-- Completion
-- ===============================
vim.pack.add({
	{ src = "https://github.com/Saghen/blink.cmp",            version = vim.version.range("^1") },
	{ src = "https://github.com/L3MON4D3/LuaSnip" },
	{ src = "https://github.com/rafamadriz/friendly-snippets" }
})

require "blink.cmp".setup({
	snippets = { preset = "luasnip" },
	keymap = {
		preset = "default",
		["<CR>"] = { "accept", "fallback" },
		["<C-space>"] = { "show" },
	},
	appearance = {
		nerd_font_variant = "mono",
	},
	completion = {
		accept = { auto_brackets = { enabled = false }, },
		menu = {
			auto_show = true,
			draw = {
				treesitter = { "lsp" },
				columns = { { "kind_icon", "label", "label_description", gap = 1 }, { "kind" } },
			},
		},
		documentation = { auto_show = true },
	},
	signature = { enabled = true },
	fuzzy = { implementation = "prefer_rust_with_warning" }
})
