return {
	"lommix/godot.nvim",
	lazy = true,
	cmd = { "GodotDebug", "GodotBreakAtCursor", "GodotStep", "GodotQuit", "GodotContinue" },
	opts = {
		bin = "godot-mono",
		expose_commands = true,
	},
}
