-- https://github.com/neovim/nvim-lspconfig

-- lsp source列表
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#rust_analyzer

return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		{
			-- https://github.com/williamboman/mason.nvim
			"williamboman/mason.nvim",
			build = ":MasonUpdate", -- :MasonUpdate updates registry contents
			cmd = { "Mason", "MasonUpdate" },
			opts = {
				ui = { border = "double" },
			},
		},
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

		-- 查看当前buffer内诊断问题
		vim.keymap.set("n", "<space>we", vim.diagnostic.setloclist)
		-- 查看当前workspace内诊断问题
		vim.keymap.set("n", "<leader>wo", require("telescope.builtin").diagnostics)

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				-- Enable completion triggered by <c-x><c-o>
				vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

				-- Buffer local mappings.
				-- See `:help vim.lsp.*` for documentation on any of the below functions
				local opts = { buffer = ev.buf }

				-- Code action
				vim.keymap.set({ "n", "v" }, "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts)
				-- Rename all occurrences of the hovered word for the selected files
				vim.keymap.set("n", "gR", "<cmd>Lspsaga rename ++project<CR>", opts)
				-- Rename all occurrences of the hovered word for the entire file
				vim.keymap.set("n", "rn", "<cmd>Lspsaga rename<CR>", opts)
				-- 悬浮窗查看定义
				vim.keymap.set("n", "gp", "<cmd>Lspsaga peek_definition<CR>", opts)
				-- 跳转到实现
				vim.keymap.set("n", "gr", require("telescope.builtin").lsp_implementations, opts)
				-- 跳转到定义
				vim.keymap.set("n", "gd", require("telescope.builtin").lsp_definitions, opts)
				-- 跳转到类型定义
				vim.keymap.set("n", "gt", require("telescope.builtin").lsp_type_definitions, opts)
				-- 诊断跳跃
				-- You can use <C-o> to jump back to your previous location
				vim.keymap.set("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
				vim.keymap.set("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)
				-- 利用过滤器跳跃，只跳转到错误
				vim.keymap.set("n", "[E", function()
					require("lspsaga.diagnostic"):goto_prev({
						severity = vim.diagnostic.severity.ERROR,
					})
				end, opts)
				vim.keymap.set("n", "]E", function()
					require("lspsaga.diagnostic"):goto_next({
						severity = vim.diagnostic.severity.ERROR,
					})
				end, opts)
				-- 动态列出工作区所有的lsp符号
				vim.keymap.set("n", "<leader>fl", "<cmd>Telescope aerial<cr>", opts)
				-- Toggle outline
				vim.keymap.set("n", "<leader>o", "<cmd>Lspsaga outline<CR>", opts)
				-- Hover Doc
				vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)
				-- 悬浮窗查看hover_doc
				vim.keymap.set("n", "<C-k>", "<cmd>Lspsaga hover_doc ++keep<CR>", opts)
				-- Call hierarchy
				vim.keymap.set("n", "<Leader>ci", "<cmd>Lspsaga incoming_calls<CR>", opts)
				vim.keymap.set("n", "<Leader>co", "<cmd>Lspsaga outgoing_calls<CR>", opts)
				-- 添加workspace
				vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
				-- workspace重命名
				vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
				-- 查看workspace
				vim.keymap.set("n", "<space>wl", function()
					print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
				end, opts)
				-- 格式化当前buffer界面
				vim.keymap.set("n", "<space>r", function()
					vim.lsp.buf.format({ async = true })
				end, opts)
			end,
		})

		-- 诊断图标
		local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
		end

		-- 显示诊断来源
		vim.diagnostic.config({
			virtual_text = {
				source = "always", -- Or "if_many"
			},
			float = {
				source = "always", -- Or "if_many"
			},
		})

		-- lsp服务器配置
		local language_servers = require("lspconfig").util.available_servers()
		for _, ls in ipairs(language_servers) do
			require("lspconfig")[ls].setup({
				capabilities = cmp_capabilities,
				capabilities = fold_capabilities,
				-- you can add other fields for setting up lsp server in this table
			})
		end

		-- lua
		require("lspconfig").lua_ls.setup({
			settings = {
				Lua = {
					runtime = {
						version = "LuaJIT",
					},
					diagnostics = {
						-- Get the language server to recognize the `vim` global
						globals = { "vim" },
					},
					workspace = {
						-- Make the server aware of Neovim runtime files
						library = vim.api.nvim_get_runtime_file("", true),
					},
					-- Do not send telemetry data containing a randomized but unique identifier
					telemetry = {
						enable = false,
					},
					-- 格式化
					format = {
						-- 禁用
						enable = false,
					},
				},
			},
		})

		-- https://github.com/rust-lang/rust-analyzer
		require("lspconfig").rust_analyzer.setup({})
	end,
}
