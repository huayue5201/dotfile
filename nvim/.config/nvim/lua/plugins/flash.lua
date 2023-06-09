-- https://github.com/folke/flash.nvim

return {
	"folke/flash.nvim",
	event = "VeryLazy",
	opts = {
		modes = {
			-- `f`, `F`, `t`, `T`, `;` and `,` motions
			char = {
				enabled = true,
				-- by default all keymaps are enabled, but you can disable some of them,
				-- by removing them from the list.
				-- If you rather use another key, you can map them
				-- to something else, e.g., { [";"] = "L", [","] = H }
				keys = { "f", "F", "t", "T" },
			},
		},
	},
	keys = {
		{
			"s",
			mode = { "n", "x", "o" },
			function()
				require("flash").jump()
			end,
			desc = "Flash",
		},
		{
			"S",
			mode = { "n", "o", "x" },
			function()
				require("flash").treesitter()
			end,
			desc = "Flash Treesitter",
		},
		{
			"r",
			mode = "o",
			function()
				require("flash").remote()
			end,
			desc = "Remote Flash",
		},
		{
			"R",
			mode = { "o", "x" },
			function()
				require("flash").treesitter_search()
			end,
			desc = "Flash Treesitter Search",
		},
		{
			"<c-s>",
			mode = { "c" },
			function()
				require("flash").toggle()
			end,
			desc = "Toggle Flash Search",
		},
	},
}
