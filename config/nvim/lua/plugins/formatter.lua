return {
	{
		"stevearc/conform.nvim",
		opts = {},
		config = function()
			local conform = require("conform")

			conform.setup({
				formatters_by_ft = {
					lua = { "stylua" },
					c = { "clangd-format" },
					cs = { "clangd-format" },
					cpp = { "clangd-format" },
					json = { "jq" },
				},
				format_on_save = {
					timeout_ms = 500,
					lsp_format = "fallback",
				},
			})

			-- format
			vim.keymap.set("n", "==", function()
				conform.format()
			end, {})
		end,
	},
}
