-- https://github.com/numToStr/Comment.nvim

return {
	"numToStr/Comment.nvim",
	keys = {
		{ "gcc", desc = "行注释" },
		{ "gbc", desc = "块注释" },
		{ "gcO", desc = "当前行上方写入注释" },
		{ "gco", desc = "当前行下方写入注释" },
		{ "gcA", desc = "当前行后方写入注释" },
		{
			"gc",
			"gb",
			mode = "v",
		},
	},
	config = function()
		require("Comment").setup({
			pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
		})
	end,
}
