-- https://github.com/nvim-neorg/neorg

return {
	"nvim-neorg/neorg",
	build = ":Neorg sync-parsers",
	dependencies = "nvim-lua/plenary.nvim",
	ft = "norg",
	opts = {
		load = {
			-- 基础模块
			["core.defaults"] = {}, -- Loads default behaviour
			-- 标记图标渲染
			["core.concealer"] = {}, -- Adds pretty icons to your documents
			-- neorg workspaces管理
			["core.dirman"] = { -- Manages Neorg workspaces
				config = {
					workspaces = {
						notes = "~/notes",
					},
				},
			},
		},
	},
}
