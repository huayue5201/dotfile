return {
	"cbochs/portal.nvim",
	-- Optional dependencies
	dependencies = {
		"ThePrimeagen/harpoon",
	},
	keys = {
		{ "<leader>o", "<cmd>Portal jumplist backward<cr>", desc = "C-o列表" },
		{ "<leader>i", "<cmd>Portal jumplist forward<cr>", desc = "C-i列表" },
		{ "<leader>p", [[<cmd>lua require("portal.builtin").harpoon.tunnel()<cr>]], desc = "harpoon列表" },
	},
}
