vim.pack.add{
    { src = "https://github.com/nvim-telescope/telescope.nvim" },
    { src = "https://github.com/nvim-lua/plenary.nvim" },
    { src = "https://github.com/nvim-telescope/telescope-fzf-native.nvim", build = "make",
	cond = function()
	    return vim.fn.executable "make" == 1
	end,
    },
    { src = "https://github.com/nvim-telescope/telescope-ui-select.nvim" },
    { src = "https://github.com/nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font }
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

local builtin = require "telescope.builtin"
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "[F]ind [H]elp" })
vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "[S]earch [K]eymaps" })
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "[F]ind [F]iles" })
vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "[S]earch current [W]ord" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "[F]ind by [G]rep" })
vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
vim.keymap.set("n", "<leader>sr", builtin.resume, { desc = "[S]earch [R]esume" })

vim.keymap.set("n", "<leader>/", function()
    builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown {
	winblend = 10,
	previewer = false,
    })
end, { desc = "[/] Fuzzily search in current buffer" })

vim.keymap.set("n", "<leader>s/", function()
    builtin.live_grep {
	grep_open_files = true,
	prompt_title = "Live Grep in Open Files"
    }
end, { desc = "[/] Live Grep in Open Files" })

vim.keymap.set("n", "<leader>ec", function()
    builtin.find_files { cwd = vim.fn.stdpath "config" }
end, { desc = "[E]dit [C]onfig" })
