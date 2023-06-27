-- https://github.com/L3MON4D3/LuaSnip

return {
	"L3MON4D3/LuaSnip",
	-- follow latest release.
	version = "<CurrentMajor>.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
	-- install jsregexp (optional!).
	build = "make install_jsregexp",
	-- https://github.com/saadparwaiz1/cmp_luasnip
	ependencies = "rafamadriz/friendly-snippets",
	config = function()
		require("luasnip.loaders.from_vscode").lazy_load({
			-- 自定义代码片段存放地址
			paths = {
				vim.fn.stdpath("config") .. "/my-snippets",
			},
		})

		-- 带有虚拟文本的提示节点类型
		local types = require("luasnip.util.types")

		require("luasnip").config.setup({
			ext_opts = {
				[types.choiceNode] = {
					active = {
						virt_text = { { "●", "GruvboxOrange" } },
					},
				},
				[types.insertNode] = {
					active = {
						virt_text = { { "●", "GruvboxBlue" } },
					},
				},
			},
		})
	end,
}
