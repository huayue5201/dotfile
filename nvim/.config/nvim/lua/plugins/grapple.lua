-- https://github.com/cbochs/grapple.nvim

return {
	"cbochs/grapple.nvim",
	keys = {
		{ "<leader>a", "<cmd>GrappleToggle<cr>", desc = "添加书签" },
		{ "<leader>ta", "<cmd>GrapplePopup tags<cr>", desc = "书签列表" },
		{ "<leader>to", "<cmd>GrapplePopup scopes<cr>", desc = "项目列表" },
	},
	dependencies = { "nvim-lua/plenary.nvim" },
	config = true,
}
