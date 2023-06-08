-- https://github.com/chentoast/marks.nvim

return {
	"chentoast/marks.nvim",
	lazy = true,
	event = { "BufReadPre", "BufNewFile" },
	keys = {
		{ "<leader>tm", "<cmd>MarksListAll<cr>",     desc = "查看所有标记" },
		{ "<leader>tk", "<cmd>BookmarksListAll<cr>", desc = "查看所有书签" },
	},
	opts = {
		default_mappings = true,
		-- builtin_marks = { ".", "<", ">", "^" },
		cyclic = true,
		force_write_shada = false,
		refresh_interval = 250,
		sign_priority = { lower = 10, upper = 15, builtin = 8, bookmark = 20 },
		excluded_filetypes = {
			"qf",
			"NvimTree",
			"toggleterm",
			"TelescopePrompt",
			"alpha",
			"netrw",
		},
		bookmark_0 = {
			sign = "⚑",
			virt_text = "hello world",
			annotate = false,
		},
		mappings = {},
	},
}
