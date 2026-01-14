-- LSP Language Server Protocol
--- C
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

--- Zig
vim.lsp.config("zls", {
	init_options = {
		provideFormatter = true,
	},
})
vim.lsp.enable("zls")
