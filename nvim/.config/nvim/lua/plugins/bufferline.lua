-- https://github.com/akinsho/bufferline.nvim

return {
	"akinsho/bufferline.nvim",
	lazy = false,
	version = "*",
	opts = {
		options = {
			toggle_hidden_on_enter = true,
			-- 侧边栏偏移设置
			offsets = {
				{
					filetype = "neo-tree",
					text = "            File Explorer",
					highlight = "Directory",
					text_align = "left",
				},
				{
					filetype = "aerial",
					text = "󰡱 Symbols Outline     ",
					highlight = "Directory",
					text_align = "right",
				},
			},
			-- lsp支持
			diagnostics = "nvim_lsp",
			diagnostics_indicator = function(count, level, diagnostics_dict, context)
				if context.buffer:current() then
					return ""
				end
				return ""
			end,
		},
	},
}
