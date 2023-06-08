-- https://github.com/jose-elias-alvarez/null-ls.nvim

return {
	"jose-elias-alvarez/null-ls.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local null_ls = require("null-ls")

		-- sources
		local sources = {
			-- https://github.com/dprint/dprint
			-- 格式化框架
			null_ls.builtins.formatting.dprint,
			-- https://github.com/JohnnyMorganz/StyLua
			null_ls.builtins.formatting.stylua,
		}

		-- 注册sources
		null_ls.setup({ sources = sources })
	end,
}

-- sources列表
-- https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#formatting
