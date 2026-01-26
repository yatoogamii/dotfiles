return {
	"saghen/blink.cmp",
	version = "1.*",
	dependencies = {
		"xzbdmw/colorful-menu.nvim",
		"Exafunction/windsurf.nvim",
	},
	opts = {
		keymap = { preset = "default", ["<CR>"] = { "select_and_accept", "fallback" } },
		cmdline = { enabled = false },
		appearance = {
			nerd_font_variant = "mono",
		},
		completion = {
			documentation = { auto_show = true },
			ghost_text = { enabled = false },
			menu = {
				draw = {
					-- Better Highlight with corloful-menu.nvim
					columns = { { "kind_icon" }, { "label", gap = 1 } },
					components = {
						label = {
							text = function(ctx)
								return require("colorful-menu").blink_components_text(ctx)
							end,
							highlight = function(ctx)
								return require("colorful-menu").blink_components_highlight(ctx)
							end,
						},
					},
				},
			},
		},
		sources = {
			default = { "lsp", "omni", "codeium" },
			providers = {
				codeium = { name = "Codeium", module = "codeium.blink", async = true },
			},
		},
		fuzzy = { implementation = "prefer_rust_with_warning" },
		signature = { enabled = true },
	},
	opts_extend = { "sources.default" },
}
