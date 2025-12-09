vim.g.mapleader = " "

vim.keymap.set("n", ";", ":", {})
vim.keymap.set("n", ":", "<Nop>", {})

-- movement
vim.keymap.set("n", "<Left>", "<Nop>", {})
vim.keymap.set("n", "<Up>", "<Nop>", {})
vim.keymap.set("n", "<Right>", "<Nop>", {})
vim.keymap.set("n", "<Down>", "<Nop>", {})
-- vim.keymap.set("i", "<Left>", "<Nop>", {})
-- vim.keymap.set("i", "<Up>", "<Nop>", {})
-- vim.keymap.set("i", "<Right>", "<Nop>", {})
-- vim.keymap.set("i", "<Down>", "<Nop>", {})

-- terminal
vim.keymap.set("n", "<F12>", "<cmd>ToggleTerm<cr>", {})
vim.keymap.set("t", "<F12>", "<cmd>ToggleTerm<cr>", {})
vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], {})

-- tabs
-- move between tabs
vim.keymap.set("n", "<A-k>", "<C-w>k", {})
vim.keymap.set("n", "<A-j>", "<C-w>j", {})
vim.keymap.set("n", "<A-h>", "<C-w>h", {})
vim.keymap.set("n", "<A-l>", "<C-w>l", {})
vim.keymap.set("t", "<A-k>", "<Cmd>wincmd k<CR>", {})
vim.keymap.set("t", "<A-j>", "<Cmd>wincmd j<CR>", {})
vim.keymap.set("t", "<A-h>", "<Cmd>wincmd h<CR>", {})
vim.keymap.set("t", "<A-l>", "<Cmd>wincmd l<CR>", {})
-- move tabs
vim.keymap.set("n", "<S-J>", "<C-w>J", {})
vim.keymap.set("n", "<S-K>", "<C-w>K", {})
vim.keymap.set("n", "<S-L>", "<C-w>L", {})
vim.keymap.set("n", "<S-H>", "<C-w>H", {})

-- Redo
vim.keymap.set("n", "U", "<C-r>", {})

-- completion
vim.keymap.set("n", "<leader>1", function()
  vim.lsp.buf.hover()
end, {})
vim.keymap.set("n", "<leader>2", function()
  vim.diagnostic.open_float()
end, {})
vim.keymap.set("n", "<leader>3", "<cmd>FzfLua lsp_code_actions<CR>", {})

-- GoTo
vim.keymap.set("n", "gd", vim.lsp.buf.definition)
vim.keymap.set("n", "gr", vim.lsp.buf.rename)
vim.keymap.set("n", "gi", vim.lsp.buf.implementation)

-- Tree
vim.keymap.set("n", "<F1>", "<cmd>Neotree toggle<cr>", {})
vim.keymap.set("i", "<F1>", "<Nop>", {})

-- Diagnostic
vim.keymap.set("n", "<leader>[", vim.diagnostic.goto_next)
vim.keymap.set("n", "<leader>]", vim.diagnostic.goto_prev)
