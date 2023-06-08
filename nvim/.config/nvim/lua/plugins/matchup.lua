-- https://github.com/andymass/vim-matchup
-- 在你光标位置将if..else if..else等语言内的对应标签高亮,扩展你的%键能力,使用方式:配置即用，在if等可以配对的标签处点击%跳到下一个匹配处

return {
	"andymass/vim-matchup",
	-- Highlight, jump between pairs like if..else
	lazy = true,
	event = { "User FileOpened" },
	dependencies = { "nvim-treesitter/nvim-treesitter" },
	config = function()
		vim.g.matchup_matchparen_offscreen = { method = "popup" }
		lvim.builtin.treesitter.matchup.enable = true
	end,
}
