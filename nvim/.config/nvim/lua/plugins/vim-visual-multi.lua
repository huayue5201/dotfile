-- https://github.com/mg979/vim-visual-multi

return {
	"mg979/vim-visual-multi",
	keys = { "\\\\", "C-n" },
	config = function()
		vim.cmd([[
				" 开启鼠标支持
				let g:VM_mouse_mappings = 1
				" 映射
				let g:VM_maps = {}
				" 多光标模式下撤销所有更改
				let g:VM_maps["Undo"] = 'u'
			   let g:VM_maps["Redo"] = '<C-r>'
				let g:VM_maps["Select Cursor Down"] = '<M-Down>'
            let g:VM_maps["Select Cursor Up"] = '<M-Up>'
		]])
	end,
}
