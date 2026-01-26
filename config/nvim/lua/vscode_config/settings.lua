-- Undo
vim.opt.undofile = true

-- Keep the cursor in the middle of the screen when possible
vim.opt.scrolloff = 20

-- Diagnostic Config
vim.diagnostic.config({
	-- Show the error floating
	virtual_text = false,
	-- Show the error in virtual line instead of floating
	virtual_lines = false,
	-- Show the underline below the error
	underline = true,
	-- Show the letter E/W on the sidebar where the error is
	signs = true,
})
