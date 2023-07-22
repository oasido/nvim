local options = {
	guicursor = "",
	number = true,
	relativenumber = true,

	incsearch = true,
	ignorecase = true,

	showmode = false,

	splitbelow = true,
	splitright = true,

	termguicolors = true,

	undodir = os.getenv("HOME") .. "/.vim/undodir",
	undofile = true,
	backup = false,
	swapfile = false,
	writebackup = false,
	updatetime = 400,

	expandtab = true,
	tabstop = 2,
	shiftwidth = 2,
	softtabstop = 2,

	smartindent = true,

	signcolumn = "yes",
	vim.opt.isfname:append("@-@"),
	scrolloff = 8,

	switchbuf = "useopen,uselast", -- Don't reopen buffers
	linebreak = true,
	wrap = true,
	whichwrap = "h,l", -- allow cursor to wrap to next/prev line
	showbreak = "↳ ",
}

for k, v in pairs(options) do
	vim.opt[k] = v
end

vim.cmd("set whichwrap+=<,>,[,],h,l")
vim.cmd([[set iskeyword+=-]])
vim.cmd([[set t_Co=256]])

vim.opt.shortmess:append("c")

-- Desc: Netrw settings
vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25

