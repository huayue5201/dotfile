-- https://github.com/cbochs/portal.nvim

return {
	"cbochs/portal.nvim",
	keys = {
		{ "<leader>o", "<cmd>Portal jumplist backward<cr>", desc = "前进" },
		{ "<leader>i", "<cmd>Portal jumplist forward<cr>", desc = "后退" },
		{ "<leader>p", [[<cmd>lua require("portal.builtin").harpoon.tunnel()<cr>]], desc = "快速书签" },
	},
	-- Optional dependencies
	dependencies = {
		"ThePrimeagen/harpoon",
	},
	cofnig = true,
}
