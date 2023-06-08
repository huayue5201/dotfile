-- 配置模块加载目录

-- 加载基本配置
require("config.options")
-- lazy加载
require("config.lazy")

vim.api.nvim_create_autocmd("User", {
	pattern = "VeryLazy",
	callback = function()
		require("config.autocmds")
		require("config.keymaps")
	end,
})
