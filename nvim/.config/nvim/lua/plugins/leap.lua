-- https://github.com/ggandor/leap.nvim
-- 快速移动光标

return {
	"ggandor/leap.nvim",
	keys = { "s", "S", "f", "F", "t", "T" },
	dependencies = {
		"tpope/vim-repeat",
		{
			"ggandor/flit.nvim",
			keys = { f = "f", F = "F", t = "t", T = "T" },
			opts = {
				-- A string like "nv", "nvo", "o", etc.
				labeled_modes = "v",
				multiline = true,
				-- Like `leap`s similar argument (call-specific overrides).
				-- E.g.: opts = { equivalence_classes = {} }
				opts = {},
			},
		},
		{ "ggandor/leap-spooky.nvim", config = true },
	},
	config = function()
		require("leap").add_default_mappings()
	end,
}
