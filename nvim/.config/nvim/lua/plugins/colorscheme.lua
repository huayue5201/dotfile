-- https://github.com/navarasu/onedark.nvim
-- 主题配置

return {
	{
		"navarasu/onedark.nvim",
		lazy = false, -- make sure we load this during startup if it is your main colorscheme
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			require("onedark").setup({
				-- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
				style = "darker",
				-- 关闭/隐藏背景色
				transparent = false,
				-- Lualine options --
				lualine = {
					transparent = true, -- lualine center bar transparency
				},
			})
			require("onedark").load()
		end,
	},
}
