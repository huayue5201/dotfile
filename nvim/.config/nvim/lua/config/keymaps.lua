-- 退出
vim.keymap.set("n", "<leader>q", "<cmd>q<cr>")
-- 保存
vim.keymap.set("n", "<leader>w", "<cmd>w<cr>")

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
vim.keymap.set("n", "<leader>gg", "ggVG")

-- 手动开启拼写检查
vim.keymap.set("n", "<leader>sp", "<cmd>setlocal spell! spelllang=en_us<cr>")

-- 复制到"*"\"+"寄存器
vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("v", "<leader>y", '"+y')

-- 正常模式下按 ESC 取消高亮显示
vim.keymap.set("n", "<ESC>", "<cmd>nohlsearch<cr>")
