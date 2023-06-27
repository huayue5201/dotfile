-- 保存
vim.keymap.set("n", ";s", "<cmd>w<cr>")
-- 退出
vim.keymap.set("n", ";q", "<cmd>q<cr>")

-- 代码块缩进
vim.keymap.set("v", ">", ">gv")
vim.keymap.set("v", "<", "<gv")

-- 关闭当前buffer
vim.keymap.set("n", "<C-q>", "<cmd>bdelete<cr>")
-- 关闭当前终端
vim.keymap.set("t", "<C-q>", "<cmd>bdelete<cr>")
-- 切换到下一个buffer
vim.keymap.set("n", "<TAB>", "<cmd>BufferLineCycleNext<cr>")
-- 切换到上一个buffer
vim.keymap.set("n", "<S-TAB>", "<cmd>BufferLineCyclePrev<cr>")

-- 一键全选
vim.keymap.set("n", ";gg", "ggVG")

-- 正常模式下按 ESC 取消高亮显示
vim.keymap.set("n", "<ESC>", "<cmd>nohlsearch<cr>")
