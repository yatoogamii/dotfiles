return {
  {
    "williamboman/mason.nvim",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "neovim/nvim-lspconfig",
      "seblyng/roslyn.nvim",
    },
    config = function()
      require("mason").setup({
        registries = {
          "github:mason-org/mason-registry",
          "github:Crashdummyy/mason-registry",
        },
      })
      require("mason-lspconfig").setup({
        ensure_installed = { "ts_ls", "lua_ls", "jsonls", "gopls", "terraformls", "rust_analyzer", "clangd" },
      })

      vim.lsp.enable("ts_ls")
      vim.lsp.enable("lua_ls")
      vim.lsp.enable("jsonls")
      vim.lsp.enable("gopls")
      vim.lsp.enable("terraformls")
      vim.lsp.enable("rust_analyzer")
      vim.lsp.enable("roslyn")
      vim.lsp.enable("clangd")
    end,
  },
}
