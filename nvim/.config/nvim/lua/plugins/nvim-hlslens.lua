-- https://github.com/kevinhwang91/nvim-hlslens

return {
	"kevinhwang91/nvim-hlslens",
	lazy = true,
	keys = { "/", "?", mode = "n" },
	config = function()
		require("hlslens").setup({
			calm_down = true,
			nearest_only = true,
			nearest_float_when = "always",
		})

		-- run `:nohlsearch` and export results to quickfix
		-- if Neovim is 0.8.0 before, remap yourself.
		vim.keymap.set({ "n", "x" }, "<Leader>nl", function()
			vim.schedule(function()
				if require("hlslens").exportLastSearchToQuickfix() then
					vim.cmd("cw")
				end
			end)
			return ":noh<CR>"
		end, { expr = true })

		-- if Neovim is 0.8.0 before, remap yourself.
		local function nN(char)
			local ok, winid = hlslens.nNPeekWithUFO(char)
			if ok and winid then
				-- Safe to override buffer scope keymaps remapped by ufo,
				-- ufo will restore previous buffer keymaps before closing preview window
				-- Type <CR> will switch to preview window and fire `trace` action
				vim.keymap.set("n", "<CR>", function()
					local keyCodes = api.nvim_replace_termcodes("<Tab><CR>", true, false, true)
					api.nvim_feedkeys(keyCodes, "im", false)
				end, { buffer = true })
			end
		end

		vim.keymap.set({ "n", "x" }, "n", function()
			nN("n")
		end)
		vim.keymap.set({ "n", "x" }, "N", function()
			nN("N")
		end)

		local kopts = { noremap = true, silent = true }

		vim.api.nvim_set_keymap(
			"n",
			"n",
			[[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]],
			kopts
		)
		vim.api.nvim_set_keymap(
			"n",
			"N",
			[[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]],
			kopts
		)
		vim.api.nvim_set_keymap("n", "*", [[*<Cmd>lua require('hlslens').start()<CR>]], kopts)
		vim.api.nvim_set_keymap("n", "#", [[#<Cmd>lua require('hlslens').start()<CR>]], kopts)
		vim.api.nvim_set_keymap("n", "g*", [[g*<Cmd>lua require('hlslens').start()<CR>]], kopts)
		vim.api.nvim_set_keymap("n", "g#", [[g#<Cmd>lua require('hlslens').start()<CR>]], kopts)
	end,
}
