-- https://github.com/nathom/filetype.nvim
-- 加速启动

return {
	"nathom/filetype.nvim",
	lazy = true,
	event = "User FileOpened",
	config = function()
		require("filetype").setup({
			overrides = {
				extensions = {
					h = "cpp",
				},
			}
		})
	end,
}
