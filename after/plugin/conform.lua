local conform = require("conform")
local prettier = { "prettierd", "prettier" }

conform.setup({
	formatters_by_ft = {
		javascript = { prettier },
		typescript = { prettier },
		javascriptreact = { prettier },
		typescriptreact = { prettier },
		css = { prettier },
		html = { prettier },
		json = { prettier },
		jsonc = { prettier },
		yaml = { prettier },
		markdown = { prettier },
		lua = { "stylua" },
		go = { "goimports", "gofmt" },
		graphql = { prettier },
		sh = { "shfmt" },
		python = { "isort", "black" },
	},
})
