require("nvim-treesitter.configs").setup({
	-- A list of parser names, or "all"

	ensure_installed = {
		"vimdoc",
		"bash",
		"json",
		"html",
		"markdown",
		"markdown_inline",
		"yaml",
		"javascript",
		"typescript",
		"c",
		"lua",
		"rust",
	},

	-- Install parsers synchronously (only applied to `ensure_installed`)
	sync_install = false,

	-- Automatically install missing parsers when entering buffer
	-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
	auto_install = true,

	highlight = {
		-- `false` will disable the whole extension
		enable = true,

		-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
		-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
		-- Using this option may slow down your editor, and you may see some duplicate highlights.
		-- Instead of true it can also be a list of languages
		disable = function(lang, buf)
			local max_filesize = 100 * 1024 -- 100 KB
			local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
			if ok and stats and stats.size > max_filesize then
				return true
			end
		end,

		additional_vim_regex_highlighting = false,
	},

	-- windwp/nvim-ts-autotag
	autotag = {
		enable = true,
	},
})

vim.cmd([[TSContextDisable]]) -- auto disable ts context
vim.keymap.set("n", "<leader>tsc", ":TSContextToggle<CR>")
