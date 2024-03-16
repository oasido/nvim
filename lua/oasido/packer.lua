-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd.packadd("packer.nvim")

return require("packer").startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")

	-- Essentials
	use("nvim-lua/plenary.nvim")
	use({
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup({
				pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
			})
		end,
	})
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		requires = { { "nvim-lua/plenary.nvim" } },
	})
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
	use({
		"folke/persistence.nvim",
		event = "BufReadPre",
		module = "persistence",
		config = function()
			require("persistence").setup()
		end,
	})
	use({ "tpope/vim-fugitive" })
	use({ "windwp/nvim-autopairs" })
	use({ "lambdalisue/suda.vim" })

	-- Style
	use({ "nvim-lualine/lualine.nvim", requires = { "nvim-tree/nvim-web-devicons", opt = true } })
	use({
		"goolord/alpha-nvim",
		config = function()
			require("alpha").setup(require("alpha.themes.startify").config)
		end,
	})
	use("nvim-tree/nvim-web-devicons")
	use({ "EdenEast/nightfox.nvim", as = "nightfox" })
	use("yamatsum/nvim-cursorline")
	use({ "stevearc/dressing.nvim" })

	-- Troubleshooting
	use({
		"folke/trouble.nvim",
		config = function()
			require("trouble").setup({ icons = false })
		end,
	})

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		requires = { "JoosepAlviste/nvim-ts-context-commentstring" },
		run = function()
			require("nvim-treesitter.install").update({ with_sync = true })
		end,
	})
	use("nvim-treesitter/playground")

	-- File Navigation
	use("theprimeagen/harpoon")
	use("theprimeagen/refactoring.nvim")
	use("mbbill/undotree")
	use("nvim-treesitter/nvim-treesitter-context")
	use({
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
		},
	})

	-- Completion and LSP
	-- use({ "zbirenbaum/copilot.lua" })
	-- use({ "zbirenbaum/copilot-cmp", after = { "copilot.lua" } })
	use({
		"VonHeikemen/lsp-zero.nvim",
		branch = "v3.x",
		requires = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" }, -- Required
			{ "williamboman/mason.nvim" }, -- Optional
			{ "williamboman/mason-lspconfig.nvim" }, -- Optional

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" }, -- Required
			{ "hrsh7th/cmp-nvim-lsp" }, -- Required
			-- { "L3MON4D3/LuaSnip" },     -- Required
			{
				"L3MON4D3/LuaSnip",
				-- follow latest release.
				tag = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
				-- install jsregexp (optional!:).
				run = "make install_jsregexp",
			},
			{ "saadparwaiz1/cmp_luasnip" },

			{ "rafamadriz/friendly-snippets" },
			{ "hrsh7th/cmp-nvim-lua" },
			{ "hrsh7th/cmp-path" },
			{ "hrsh7th/cmp-buffer" },
		},
	})

	-- Formatting
	use({ "stevearc/conform.nvim" })

	-- Wakatime
	use("wakatime/vim-wakatime")

	-- Markdown
	-- use("vim-pandoc/vim-pandoc")
	-- use("vim-pandoc/vim-pandoc-syntax")
	use({
		"iamcco/markdown-preview.nvim",
		run = function()
			vim.fn["mkdp#util#install"]()
		end,
	})
	use({
		"epwalsh/obsidian.nvim",
		tag = "*", -- recommended, use latest release instead of latest commit
		requires = {
			"nvim-lua/plenary.nvim",
		},
	})

	use({ "shortcuts/no-neck-pain.nvim", tag = "*" })

	-- FML
	use("eandrju/cellular-automaton.nvim")
end)
