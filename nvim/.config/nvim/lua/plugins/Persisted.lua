-- https://github.com/olimorris/persisted.nvim

return {
	"olimorris/persisted.nvim",
	keys = {
		{ "<leader>ws", "<cmd>SessionSave<cr>",   desc = "保存session" },
		{ "<leader>wg", "<cmd>SessionLoad<cr>",   desc = "加载Git分支session" },
	},
	opts = {
		use_git_branch = true,
		-- 是否自动保存session
		autosave = false,
	},
}
