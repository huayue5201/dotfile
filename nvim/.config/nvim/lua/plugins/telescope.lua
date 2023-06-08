-- https://github.com/nvim-telescope/telescope.nvim
-- 模糊搜索器

return {
	"nvim-telescope/telescope.nvim",
	cmd = "Telescope",
	keys = {
		{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "文件查找" },
		{ "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "字符查找" },
		{ "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "buff查找" },
		{ "<leader>fh", "<cmd>Telescope frecency<cr>", desc = "历史查找" },
		{ "<leader>fm", "<cmd>lua require'telescope.builtin'.command_history{}<cr>", desc = "查找历史命令" },
		{ "<leader>tp", "<cmd>Telescope persisted<cr>", desc = "session管理" },
	},
	-- telescope扩展依赖
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		{ "nvim-telescope/telescope-frecency.nvim", dependencies = "kkharji/sqlite.lua" },
	},
	config = function()
		-- persisted扩展
		require("telescope").load_extension("persisted")
		-- AckslD/nvim-neoclip.lua
		require("telescope").load_extension("neoclip")
		-- nvim-telescope/telescope-frecency.nvim
		require("telescope").load_extension("frecency")
		-- folke/noice.nvim
		require("telescope").load_extension("noice")
		-- stevearc/aerial.nvim
		require("telescope").load_extension("aerial")
		-- esc键退出
		local actions = require("telescope.actions")
		-- telescope配置
		require("telescope").setup({
			defaults = {
				mappings = {
					i = {
						-- ["<esc>"] = actions.close,
					},
				},
			},
			pickers = {
				find_files = {
					theme = "dropdown",
				},
				live_grep = {
					theme = "dropdown",
				},
				buffers = {
					theme = "dropdown",
					mappings = {
						i = {
							["<c-d>"] = actions.delete_buffer + actions.move_to_top,
						},
					},
				},
			},
			extensions = {
				aerial = {
					-- Display symbols as <root>.<parent>.<symbol>
					show_nesting = {
						["_"] = false, -- This key will be the default
						json = true, -- You can set the option for specific filetypes
						yaml = true,
					},
				},
				persisted = {
					layout_config = { width = 0.55, height = 0.55 },
				},
				fzf = {
					fuzzy = true, -- false will only do exact matching
					override_generic_sorter = true, -- override the generic sorter
					override_file_sorter = true, -- override the file sorter
					case_mode = "smart_case", -- or "ignore_case" or "respect_case"
					-- the default case_mode is "smart_case"
				},
			},
		})
		-- nvim-telescope/telescope-fzf-native.nvim
		require("telescope").load_extension("fzf")
	end,
}
