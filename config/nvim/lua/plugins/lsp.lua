return {
	{
		"williamboman/mason.nvim",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
			"neovim/nvim-lspconfig",
		},
		config = function()
			require("mason").setup()
			require("mason-lspconfig").setup({
				ensure_installed = { "ts_ls", "lua_ls", "jsonls", "gopls", "terraformls" },
			})

			vim.lsp.enable("ts_ls")
			vim.lsp.enable("lua_ls")
			vim.lsp.enable("jsonls")
			vim.lsp.enable("gopls")
			vim.lsp.enable("terraformls")
		end,
	},
}
