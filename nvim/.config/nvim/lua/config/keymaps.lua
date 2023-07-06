-- 保存
vim.keymap.set("n", ";s", "<cmd>w<cr>", { desc = "保存" })

-- 代码块缩进
vim.keymap.set("v", ">", ">gv")
vim.keymap.set("v", "<", "<gv")

-- 关闭当前buffer
vim.keymap.set("n", "<C-q>", "<cmd>bdelete<cr>")
-- 关闭当前终端
vim.keymap.set("t", "<C-q>", "<cmd>bdelete<cr>")
-- 一键全选
vim.keymap.set("n", ";gg", "ggVG", { desc = "全选" })

-- 正常模式下按 ESC 取消高亮显示
vim.keymap.set("n", "<ESC>", "<cmd>nohlsearch<cr>")
