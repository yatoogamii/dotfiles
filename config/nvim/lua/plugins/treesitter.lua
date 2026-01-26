return {
	"nvim-treesitter/nvim-treesitter",
	opts = {},
	lazy = false,
	build = ":TSUpdate",
	config = function()
		local treesitter = require("nvim-treesitter")

		-- Install parsers
		treesitter.install({
			"c",
			"vim",
			"lua",
			"markdown",
			"markdown_inline",
			"cpp",
			"c_sharp",
			"json",
			"comment",
			"go",
		})
	end,
}
