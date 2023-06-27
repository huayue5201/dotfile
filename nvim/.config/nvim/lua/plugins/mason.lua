-- https://github.com/williamboman/mason.nvim

return {
	"williamboman/mason.nvim",
	build = ":MasonUpdate", -- :MasonUpdate updates registry contents
	cmd = { "Mason", "MasonUpdate" },
	opts = {
		ui = { border = "double" },
	},
}
