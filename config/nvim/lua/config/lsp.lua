-- LSP Language Server Protocol
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

--- GO
vim.lsp.config("gopls", {})
vim.lsp.enable("gopls")

--- YAML
vim.lsp.config("yamlls", {})
vim.lsp.enable("yamlls")

--- Zig
vim.lsp.config("zls", {
	init_options = {
		provideFormatter = true,
	},
})
vim.lsp.enable("zls")

--- Terraform
vim.lsp.config("terraformls", {})
vim.lsp.enable("terraformls")

--- JS/TS
vim.lsp.config("ts_ls", {})
vim.lsp.enable("ts_ls")
vim.lsp.config("eslint", {})
vim.lsp.enable("eslint")

--- Docker
vim.lsp.config("docker_language_server", {})
vim.lsp.enable("docker_language_server")
