-- https://github.com/AckslD/nvim-neoclip.lua

return {
	"AckslD/nvim-neoclip.lua",
	keys = {
		{ "<leader>ty", "<cmd>Telescope neoclip<cr>", desc = "剪贴板" },
	},
	dependencies = {
		{ "kkharji/sqlite.lua" },
		-- you'll need at least one of these
		{ "nvim-telescope/telescope.nvim" },
		-- {'ibhagwan/fzf-lua'},
	},
	config = function()
		-- 过滤空白yanks
		local function is_whitespace(line)
			return vim.fn.match(line, [[^\s*$]]) ~= -1
		end

		local function all(tbl, check)
			for _, entry in ipairs(tbl) do
				if not check(entry) then
					return false
				end
			end
			return true
		end

		require("neoclip").setup({
			history = 1000,
			-- 使用kkharji/sqlite.lua持久记录剪贴板内容
			enable_persistent_history = true,
			-- 每次复制都永久记录
			continuous_sync = true,
			-- 类容格式
			content_spec_column = true,
			-- 不要存储空白yanks
			-- 过滤空白yanks
			filter = function(data)
				return not all(data.event.regcontents, is_whitespace)
			end,
		})
	end,
}
