return {
	"nvim-telescope/telescope.nvim",
	tag = "v0.2.1",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-tree/nvim-web-devicons",
		"nvim-telescope/telescope-ui-select.nvim",
		"nvim-telescope/telescope-file-browser.nvim",
	},
	config = function()
		local telescope = require("telescope")

		-- Extensions
		telescope.load_extension("fzf")
		telescope.load_extension("ui-select")
		telescope.load_extension("file_browser")

		-- Setup
		local actions = require("telescope.actions")

		telescope.setup({
			defaults = {
				mappings = {
					i = {
						["<esc>"] = actions.close,
						["<tab>"] = actions.file_tab,
						["\\"] = actions.file_vsplit,
						["<Bar>"] = actions.file_split,
					},
				},
			},
		})

		-- Remap
		local builtin = require("telescope.builtin")

		vim.keymap.set("n", "<C-p>", builtin.find_files)
		vim.keymap.set("n", "<leader>pf", builtin.git_files)
		vim.keymap.set("n", "<leader>pl", builtin.live_grep)
		vim.keymap.set("n", "<leader>py", builtin.registers)
		vim.keymap.set("n", "<leader>pd", ":Telescope file_browser path=%:p:h select_buffer=true<CR>")
	end,
}
