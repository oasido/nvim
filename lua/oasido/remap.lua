local keymap = vim.keymap.set

-- Leader key
keymap("", "<Space>", "<Nop>")
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Basic
keymap("n", "<leader>w", "<cmd>w<cr>")
keymap("n", "<leader>x", "<cmd>SudaWrite<cr>", { silent = true })
keymap("n", "<leader>n", "<cmd>noh<cr>")

-- File Explorer
-- keymap("n", "<leader>pv", vim.cmd.Ex)
keymap("n", "<leader>`", vim.cmd.bd)

-- Window navigation
keymap("n", "<C-h>", "<C-w>h")
keymap("n", "<C-j>", "<C-w>j")
keymap("n", "<C-k>", "<C-w>k")
keymap("n", "<C-l>", "<C-w>l")
keymap("n", "<leader>k", "<cmd>cnext<CR>zz")
keymap("n", "<leader>j", "<cmd>cprev<CR>zz")

-- Resize & split
keymap("n", "<M-j>", "<Nop>")
keymap("n", "<M-k>", "<Nop>")
keymap("n", "<M-l>", ":vertical resize -2<CR>")
keymap("n", "<M-h>", ":vertical resize +2<CR>")
keymap("n", "<C-s>", ":vsplit<CR>")

-- Stay in indent mode
keymap("v", "<", "<gv")
keymap("v", ">", ">gv")

-- Move text up and do
keymap("x", "J", ":move '>+1<CR>gv-gv")
keymap("x", "K", ":move '<-2<CR>gv-gv")

-- Replace word
keymap("n", "<C-p>", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")

-- Keep center when moving around documents
keymap("n", "<C-d>", "<C-d>zz")
keymap("n", "<C-u>", "<C-u>zz")

-- Keep center on search
keymap("n", "n", "nzzzv")
keymap("n", "N", "Nzzzv")

-- tmux-sessionizer
keymap("n", "<leader>t", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- Disable mouse right click
keymap("n", "RightMouse", "<Nop>")

-- Disable F1 help
keymap("n", "<F1>", "<Nop>")

-- Disable arrow keys
-- keymap({ "n", "i", "v" }, "<Up>", "<Nop>")
-- keymap({ "n", "i", "v" }, "<Down>", "<Nop>")
-- keymap({ "n", "i", "v" }, "<Left>", "<Nop>")
-- keymap({ "n", "i", "v" }, "<Right>", "<Nop>")

-- Copy/paste with buffer
keymap("x", "<leader>p", [["_dP]])

-- Persistance
keymap("n", "<leader>ss", "<cmd>lua require('persistence').load()<cr>")
keymap("n", "<leader>sl", "<cmd>lua require('persistence').load({ last = true })<cr>")

-- Formatting
keymap("n", "<leader>f", vim.lsp.buf.format)
keymap("n", "<leader>fp", function()
  require("conform").format({ async = true, lsp_fallback = true })
end)

-- Deletion and yanking into system clipboard
keymap("n", "<leader>d", [["_d]])
keymap({ "n", "v" }, "<leader>y", [["+y]])
keymap("n", "<leader>Y", [["+Y]])

-- FML
keymap("n", "<leader>fml", "<cmd>CellularAutomaton make_it_rain<CR>")

-- Other
keymap("n", "Q", "<nop>")
keymap("n", "<c-z>", "<nop>")
keymap("n", "<leader>nn", ":NoNeckPain<cr>")
keymap("n", "<leader>ln", ":set rnu!<cr>")
vim.cmd([[command! -nargs=0 Q quit]])
vim.cmd('command! -nargs=0 W w')

-- keymap("n", "<leader><leader>", function()
--   vim.cmd("so")
-- end)
