vim.g.mapleader = " "

-- Use : instead of ; for command mode
vim.keymap.set("n", ";", ":", {})
vim.keymap.set("n", ":", "<Nop>", {})

-- Block Arrows Movement
vim.keymap.set("n", "<Left>", "<Nop>", {})
vim.keymap.set("n", "<Up>", "<Nop>", {})
vim.keymap.set("n", "<Right>", "<Nop>", {})
vim.keymap.set("n", "<Down>", "<Nop>", {})
vim.keymap.set("i", "<Left>", "<Nop>", {})
vim.keymap.set("i", "<Up>", "<Nop>", {})
vim.keymap.set("i", "<Right>", "<Nop>", {})
vim.keymap.set("i", "<Down>", "<Nop>", {})

-- tabs
-- move between tabs
vim.keymap.set("n", "<Up>", "<C-w>k", {})
vim.keymap.set("n", "<Down>", "<C-w>j", {})
vim.keymap.set("n", "<Left>", "<C-w>h", {})
vim.keymap.set("n", "<Right>", "<C-w>l", {})
-- move tabs
vim.keymap.set("n", "<A-j>", "<C-w>J", {})
vim.keymap.set("n", "<A-k>", "<C-w>K", {})
vim.keymap.set("n", "<A-l>", "<C-w>L", {})
vim.keymap.set("n", "<A-h>", "<C-w>H", {})

-- Redo
vim.keymap.set("n", "U", "<C-r>", {})

-- Diagnostic
vim.keymap.set("n", "<leader>]", function()
	vim.diagnostic.jump({ count = 1, float = false })
end)
vim.keymap.set("n", "<leader>[", function()
	vim.diagnostic.jump({ count = -1, float = false })
end)

-- GoTo
vim.keymap.set("n", "gd", vim.lsp.buf.definition)
vim.keymap.set("n", "gr", vim.lsp.buf.rename)
vim.keymap.set("n", "gi", vim.lsp.buf.implementation)

-- LSP Informations
vim.keymap.set("n", "<leader>1", function()
	vim.lsp.buf.hover({
		border = "solid",
	})
end)
vim.keymap.set("n", "<leader>2", function()
	vim.diagnostic.open_float({
		border = "solid",
	})
end)
vim.keymap.set("n", "<leader>3", vim.lsp.buf.code_action)

-- Terminal
vim.keymap.set("n", "<F12>", "<CMD>vsplit | term<CR>", {})
vim.keymap.set("t", "<esc>", "<C-\\><C-n>")

-- Remove Highlight
vim.keymap.set("n", "<esc>", "<cmd>nohl<CR>")
