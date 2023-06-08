-- https://github.com/nvim-lualine/lualine.nvim

return {
	"nvim-lualine/lualine.nvim",
	lazy = false,
	config = function()
		require("lualine").setup({
			options = {
				-- 主题Mofiqul/dracula.nvim
				theme = "dracula-nvim",
			},
			sections = {
				-- noice集成配置
				lualine_x = {
					{
						require("noice").api.status.message.get_hl,
						cond = require("noice").api.status.message.has,
					},
					{
						require("noice").api.status.command.get,
						cond = require("noice").api.status.command.has,
						color = { fg = "#ff9e64" },
					},
					{
						require("noice").api.status.mode.get,
						cond = require("noice").api.status.mode.has,
						color = { fg = "#ff9e64" },
					},
					{
						require("noice").api.status.search.get,
						cond = require("noice").api.status.search.has,
						color = { fg = "#ff9e64" },
					},
				},
				lualine_b = {
					{
						function()
							local key = require("grapple").key()
							return "  [" .. key .. "]"
						end,
						cond = require("grapple").exists,
					},
				},
			},
		})
	end,
}
