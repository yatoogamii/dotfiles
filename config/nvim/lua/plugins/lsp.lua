return {
	"mason-org/mason.nvim",
	dependencies = {
		"neovim/nvim-lspconfig",
		"seblyng/roslyn.nvim",
		{
			"khoido2003/roslyn-filewatch.nvim",
			config = function()
				require("roslyn_filewatch").setup()
			end,
		},
	},
	opts = {
		registries = {
			"github:mason-org/mason-registry",
			"github:Crashdummyy/mason-registry",
		},
	},
}
