-- https://github.com/neovim/nvim-lspconfig

-- lsp source列表
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#rust_analyzer

return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"nvim-telescope/telescope.nvim",
		"williamboman/mason.nvim",
		"jose-elias-alvarez/null-ls.nvim",
	},
	config = function()
		local lspconfig = require("lspconfig")

		-- 开启lsp折叠支持
		local fold_capabilities = vim.lsp.protocol.make_client_capabilities()
		fold_capabilities.textDocument.foldingRange = {
			dynamicRegistration = false,
			lineFoldingOnly = true,
		}

		-- nvim-cmp
		-- Set up lspconfig.
		local cmp_capabilities = require("cmp_nvim_lsp").default_capabilities()

		-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
		local servers = { "rust_analyzer", "tsserver", "lua_ls" }
		for _, lsp in ipairs(servers) do
			lspconfig[lsp].setup({
				-- on_attach = my_custom_on_attach,
				capabilities = { cmp_capabilities, fold_capabilities },
			})
		end

		-- 加载lsp配置文件 lua/lsp/...
		require("lsp.lua_ls")
		require("lsp.rust_analyzer")

		-- 查看当前buffer内诊断问题

		vim.keymap.set("n", "<space>tb", vim.diagnostic.setloclist)
		-- 查看当前workspace内诊断问题
		vim.keymap.set("n", "<leader>tw", require("telescope.builtin").diagnostics)
		-- 问题跳转
		vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
		vim.keymap.set("n", "]d", vim.diagnostic.goto_next)

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				-- Enable completion triggered by <c-x><c-o>
				vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

				-- Buffer local mappings.
				-- See `:help vim.lsp.*` for documentation on any of the below functions
				local opts = { buffer = ev.buf }

				-- Code action
				vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts)
				-- 重命名
				vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
				-- 查看引用
				vim.keymap.set("n", "gr", require("telescope.builtin").lsp_references, opts)
				-- 跳转到实现
				vim.keymap.set("n", "gi", require("telescope.builtin").lsp_implementations, opts)
				-- 跳转到定义
				vim.keymap.set("n", "gd", require("telescope.builtin").lsp_definitions, opts)
				-- 跳转到类型定义
				vim.keymap.set("n", "gt", require("telescope.builtin").lsp_type_definitions, opts)
				-- 列出工作区所有的lsp符号
				vim.keymap.set("n", "<leader>fl", "<cmd>Telescope lsp_workspace_symbols<cr>", opts)
				-- Hover Doc
				vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
				-- 添加workspace
				vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
				-- workspace重命名
				vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
				-- 查看workspace
				vim.keymap.set("n", "<space>wl", function()
					print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
				end, opts)
				-- 格式化当前buffer界面
				vim.keymap.set("n", ";f", function()
					vim.lsp.buf.format({ async = true })
				end, opts)
			end,
		})

		-- 诊断图标
		local signs = { Error = "", Warn = "", Hint = "󰌶", Info = "" }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
		end

		-- 显示诊断来源
		vim.diagnostic.config({
			virtual_text = {
				source = "always", -- Or "if_many"
				prefix = "■", -- Could be '●', '▎', 'x'
			},
			float = {
				source = "always", -- Or "if_many"
			},
		})
	end,
}
