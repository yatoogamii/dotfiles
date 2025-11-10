return {
	"nvim-treesitter/nvim-treesitter",
	opts = {
		ensure_installed = { "vim", "lua", "markdown", "javascript", "typescript", "dockerfile", "json", "yaml", "go" },
	},
	config = function()
		local configs = require("nvim-treesitter.configs")

		configs.setup({
			ensure_installed = {
				"vim",
				"lua",
				"markdown",
				"markdown_inline",
				"javascript",
				"typescript",
				"dockerfile",
				"json",
				"yaml",
				"comment",
				"jsdoc",
				"go",
			},
			highlight = { enable = true },
			indent = { enable = false },
		})
	end,
}
