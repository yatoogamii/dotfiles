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

-- Redo
vim.keymap.set("n", "U", "<C-r>", {})

-- GoTo
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

-- Remove Highlight
vim.keymap.set("n", "<esc>", "<cmd>nohl<CR>")
