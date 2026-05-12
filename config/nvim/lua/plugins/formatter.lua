return {
	{
		"stevearc/conform.nvim",
		opts = {},
		config = function()
			local conform = require("conform")

			conform.setup({
				formatters_by_ft = {
					lua = { "stylua" },
					json = { "jq" },
					markdown = { "prettier" },
					javascript = { "prettier" },
					typescript = { "prettier" },
					terraform = { "terraform_fmt" },
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
