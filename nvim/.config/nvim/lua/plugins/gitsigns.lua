-- https://github.com/lewis6991/gitsigns.nvim

return {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("gitsigns").setup({
			on_attach = function(bufnr)
				local gs = package.loaded.gitsigns

				local function map(mode, l, r, opts)
					opts = opts or {}
					opts.buffer = bufnr
					vim.keymap.set(mode, l, r, opts)
				end

				-- Navigation
				map("n", "]c", function()
					if vim.wo.diff then
						return "]c"
					end
					vim.schedule(function()
						gs.next_hunk()
					end)
					return "<Ignore>"
				end, { expr = true })

				map("n", "[c", function()
					if vim.wo.diff then
						return "[c"
					end
					vim.schedule(function()
						gs.prev_hunk()
					end)
					return "<Ignore>"
				end, { expr = true })

				-- Actions
				-- 提交改动
				map("n", "<leader>hs", gs.stage_hunk)
				map("v", "<leader>hs", function()
					gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end)
				-- 提交当前buffer改动
				map("n", "<leader>hS", gs.stage_buffer)
				-- 重置所有改动
				map("n", "<leader>hr", gs.reset_hunk)
				map("v", "<leader>hr", function()
					gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end)
				-- 重置当前buffer改动
				map("n", "<leader>hR", gs.reset_buffer)
				-- 撤销提交
				map("n", "<leader>hu", gs.undo_stage_hunk)
				-- 浮窗查看改动
				map("n", "<leader>hp", gs.preview_hunk)
				-- 浮窗查看提交信息
				map("n", "<leader>hb", function()
					gs.blame_line({ full = true })
				end)

				-- Text object
				map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>")
			end,
		})
	end,
}
