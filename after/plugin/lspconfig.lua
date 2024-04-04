-- K: Displays hover information about the symbol under the cursor in a floating window. See :help vim.lsp.buf.hover().
-- gd: Jumps to the definition of the symbol under the cursor. See :help vim.lsp.buf.definition().
-- gD: Jumps to the declaration of the symbol under the cursor. Some servers don't implement this feature. See :help vim.lsp.buf.declaration().
-- gi: Lists all the implementations for the symbol under the cursor in the quickfix window. See :help vim.lsp.buf.implementation().
-- go: Jumps to the definition of the type of the symbol under the cursor. See :help vim.lsp.buf.type_definition().
-- gr: Lists all the references to the symbol under the cursor in the quickfix window. See :help vim.lsp.buf.references().
-- gs: Displays signature information about the symbol under the cursor in a floating window. See :help vim.lsp.buf.signature_help(). If a mapping already exists for this key this function is not bound.
-- <F2>: Renames all references to the symbol under the cursor. See :help vim.lsp.buf.rename().
-- <F3>: Format code in current buffer. See :help vim.lsp.buf.format().
-- <F4>: Selects a code action available at the current cursor position. See :help vim.lsp.buf.code_action().
-- gl & <leader>e: Show diagnostics in a floating window. See :help vim.diagnostic.open_float().
-- [d: Move to the previous diagnostic in the current buffer. See :help vim.diagnostic.goto_prev().
-- ]d: Move to the next diagnostic. See :help vim.diagnostic.goto_next().
-- <leader>q: Show diagnostic split window.

local lsp_zero = require("lsp-zero")
lsp_zero.on_attach(function(client, bufnr)
	-- see :help lsp-zero-keybindings
	-- to learn the available actions
	lsp_zero.default_keymaps({ buffer = bufnr })

	-- keybindings
	local opts = { buffer = bufnr, remap = false }

	vim.keymap.set("n", "<leader>e", function()
		vim.diagnostic.open_float()
	end, opts)

	vim.keymap.set("n", "<space>q", function()
		vim.diagnostic.setloclist()
	end, opts)
end)

require("mason").setup({})
require("mason-lspconfig").setup({
	ensure_installed = {
		"lua_ls",
		"rust_analyzer",
		"tsserver",
		"astro",
		"tailwindcss",
		"marksman",
		"cssls",
		"jsonls",
		"yamlls",
	},
	handlers = {
		lsp_zero.default_setup,
		lua_ls = function()
			local lua_opts = lsp_zero.nvim_lua_ls()
			require("lspconfig").lua_ls.setup(lua_opts)
		end,
	},
})

lsp_zero.setup_servers({ "astro" })

require("luasnip.loaders.from_vscode").lazy_load()

local cmp = require("cmp")
local cmp_action = require("lsp-zero").cmp_action()
local luasnip = require("luasnip")
local cmp_select = { behavior = cmp.SelectBehavior.Select }

cmp.setup({
	sources = {
		-- { name = 'copilot' },
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		{ name = "path" },
		{ name = "nvim_lua" },
	},
	formatting = lsp_zero.cmp_format(),
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	window = {
		-- completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	-- mapping = cmp.mapping.preset.insert({
	-- 	-- scroll up and down the documentation window
	-- 	["<C-u>"] = cmp.mapping.scroll_docs(-4),
	-- 	["<C-d>"] = cmp.mapping.scroll_docs(4),
	-- 	["<CR>"] = cmp.mapping.confirm({
	-- 		behavior = cmp.ConfirmBehavior.Replace,
	-- 		select = true,
	-- 	}),
	-- 	["<C-Space>"] = cmp.mapping.complete(),
	-- 	["<Tab>"] = cmp.mapping.select_next_item(cmp_select),
	-- 	["<S-Tab>"] = cmp.mapping.select_prev_item(cmp_select),
	--
	-- 	-- Navigate between snippet placeholder
	-- 	["<C-f>"] = cmp_action.luasnip_jump_forward(),
	-- 	["<C-b>"] = cmp_action.luasnip_jump_backward(),
	-- }),
	mapping = cmp.mapping.preset.insert({
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.abort(),
		["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
	}),
})
