-- https://gitlab.com/yorickpeterse/nvim-window

return {
	"https://gitlab.com/yorickpeterse/nvim-window.git",
	event = { "WinNew" },
	keys = {
		{ "<C-w>n", "<cmd>lua require('nvim-window').pick()<cr>", mode = { "n", "t", "i" }, desc = "选择窗口" },
	},
	opts = {},
}
