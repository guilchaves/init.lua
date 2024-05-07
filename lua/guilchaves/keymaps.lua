local keymap = vim.keymap
local g = vim.g
local cmd = vim.cmd
local lsp = vim.lsp
local opts = { noremap = true, silent = true }
local diagnostic = vim.diagnostic

g.mapleader = " "

-- Go to explorer
keymap.set("n", "<leader>pv", cmd.Ex)

-- Delete word backwards
keymap.set("n", "dw", "vb_d")

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")

-- Move line up and down
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Delete bottom line if empty
keymap.set("n", "J", "mzJ`z")

-- Jump linas
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")

-- Jumplist
keymap.set("n", "<C-m>", "<C-i>", opts)

-- New tab
keymap.set("n", "te", "tabedit", opts)
keymap.set("n", "<tab>", ":tabnext<Return>", opts)
keymap.set("n", "<s-tab>", ":tabnext<Return>", opts)

-- Split window
keymap.set("n", "ss", ":vsplit<CR><C-w>w, opts")
keymap.set("n", "vs", ":split<CR><C-w>w, opts")

-- Navigate between windows
keymap.set("n", "<C-H>", "<C-W>h")
keymap.set("n", "<C-J>", "<C-W>j")
keymap.set("n", "<C-K>", "<C-W>k")
keymap.set("n", "<C-L>", "<C-W>l")

-- Resize window
keymap.set("n", "<C-w><left>", "<C-w><")
keymap.set("n", "<C-w><right>", "<C-w>>")

-- Diagnostics
keymap.set("n", "<C-j>", function()
	vim.diagnostic.goto_next()
end, opts)
keymap.set("n", "<leader>sd", diagnostic.open_float, opts)

-- Esc
keymap.set("i", "<C-c>", "<Esc>")

-- Format file
keymap.set("n", "<leader>f", lsp.buf.format)

-- Rename all occurences of word
keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

