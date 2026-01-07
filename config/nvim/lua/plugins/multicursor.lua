return {
	"jake-stewart/multicursor.nvim",
	branch = "1.0",
	config = function()
		local mc = require("multicursor-nvim")
		mc.setup()

		local set = vim.keymap.set

		set({ "n", "x" }, "`", function()
			mc.matchAddCursor(1)
		end)

		mc.addKeymapLayer(function(layerSet)
			layerSet({ "n", "x" }, "<Esc>", mc.clearCursors)
		end)
	end,
}
