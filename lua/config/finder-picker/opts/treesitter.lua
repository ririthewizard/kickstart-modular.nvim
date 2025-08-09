vim.pack.add({
    { src="https://github.com/nvim-treesitter/nvim-treesitter", version="master" }
})

require'nvim-treesitter.configs'.setup ({
  -- A list of parser names, or "all" (the listed parsers MUST always be installed)
  ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline", "html", "java", "javascript", "go", "python" },

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

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
