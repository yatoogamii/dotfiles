return {
	"folke/noice.nvim",
	event = "VeryLazy",
	opts = {
		cmdline = {},
		messages = {
			enabled = false,
		},
		popupmenu = {
			enabled = false,
		},
		notify = {
			enabled = false,
		},
		lsp = {
			progress = {
				enabled = false,
			},
			hover = {
				enabled = false,
			},
			signature = {
				enabled = false,
			},
			message = {
				enabled = false,
			},
		},
	},
	dependencies = {
		"MunifTanjim/nui.nvim",
	},
}
