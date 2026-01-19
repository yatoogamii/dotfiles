-- Theme
vim.cmd.colorscheme("nordic")

-- Undo
vim.opt.undofile = true

-- Show number on the side
vim.wo.number = true

-- Tab/Indent
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.smartindent = true

-- Keep the cursor in the middle of the screen when possible
vim.opt.scrolloff = 10

-- nvim-treesitter to activate highlight automatically by filetype
function EnableHighlightForFileTypes(filetypes)
	for _, filetype in ipairs(filetypes) do
		vim.api.nvim_create_autocmd("FileType", {
			pattern = { filetype },
			callback = function()
				vim.treesitter.start()
			end,
		})
	end
end

EnableHighlightForFileTypes({
	"c",
	"cs",
	"cpp",
	"json",
	"markdown",
	"vim",
	"lua",
})

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
