-- https://github.com/aca/emmet-ls

require("lspconfig").emmet_ls.setup({
	cmd = { "emmet-ls", "--stdio" },
	filetypes = {
		"astro",
		"css",
		"eruby",
		"html",
		"htmldjango",
		"javascriptreact",
		"less",
		"pug",
		"sass",
		"scss",
		"svelte",
		"typescriptreact",
		"vue",
	},
	single_file_support = true,
})
