-- LSP Language Server Protocol
--- C/C++
vim.lsp.config("clangd", {
	init_options = {
		provideFormatter = false,
	},
})
vim.lsp.enable("clangd")

--- Lua
vim.lsp.config("lua_ls", {
	init_options = {
		provideFormatter = false,
	},
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
		},
	},
})
vim.lsp.enable("lua_ls")

--- Json
vim.lsp.config("jsonls", {
	init_options = {
		provideFormatter = false,
	},
})
vim.lsp.enable("jsonls")

--- C#
vim.lsp.config("roslyn", {
	init_options = {
		provideFormatter = true,
	},
})
vim.lsp.enable("roslyn")

--- GO
vim.lsp.config("gopls", {})
vim.lsp.enable("gopls")

--- SQL
vim.lsp.config("sqls", {
	on_attach = function(client, _)
		client.server_capabilities.documentFormattingProvider = false
		client.server_capabilities.documentRangeFormattingProvider = false
	end,
})
vim.lsp.enable("sqls")
