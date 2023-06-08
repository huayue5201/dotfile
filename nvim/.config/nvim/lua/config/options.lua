-- 把空格键设置为前置按键
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- 禁用自带插件
-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1

-- tab长度为4个空格
vim.g.tabstop = 4
-- 缩进为4个空格
vim.g.shiftwidth = 4
-- 继承前一行的缩进方式
vim.g.autoindent = true
-- 将 TAB 键替换为空格
vim.bo.expandtab = true
-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true
-- 设定各种文本的字符编码
vim.o.encoding = "utf-8"
-- 状态栏样式配置(1、2 、3)
vim.o.laststatus = 3
-- 是否支持鼠标操作
vim.o.mouse = "a"
-- 退出vim询问是否保存
vim.o.confirm = true
-- 是否显示绝对行号
vim.o.number = true
-- 显示相对行号
vim.o.relativenumber = true
-- 是否启用系统剪切板
vim.o.clipboard = "unnamedplus"
-- 会话设置
vim.o.sessionoptions = "buffers,curdir,folds,winpos,winsize"
-- 设定光标上下两侧最少保留的屏幕行数
vim.o.scrolloff = 8
-- 禁止创建备份文件
vim.o.backup = false
vim.o.writebackup = false
vim.o.swapfile = false
vim.o.undofile = true
-- 当文件被外部程序修改时，自动加载
vim.o.autoread = true
-- vim.bo.autoread = true
-- 缩短更新时间
vim.o.updatetime = 250
vim.wo.signcolumn = "yes"
-- 设定等待按键时长的毫秒数
-- vim.o.timeoutlen = 500
-- 是否高亮当前文本行
vim.o.cursorline = true
-- 是否开启 xterm 兼容的终端 24 位色彩支持
vim.o.termguicolors = true
-- 自动补全不自动选中
vim.g.completeopt = "menu,menuone,noselect,noinsert"
-- 补全最多显示14行
vim.o.pumheight = 14
-- 是否开启自动缩进
vim.o.autoindent = true
-- 缩进规则为"plugin" nvim/plugin/xx.lua
vim.o.smartindent = true
-- 设定单词拼写检查的语言
vim.o.spelllang = "en_us,cjk"
-- 不区分大小写的搜索，除非搜索中包含大写
vim.o.ignorecase = true
vim.o.smartcase = true
-- 是否特殊显示空格等字符
vim.o.list = true
-- 空格用⋅显示
vim.opt.list = true
vim.opt.listchars:append("space:⋅")
vim.opt.listchars:append("eol:↴")
-- 边栏空一格显示符号
vim.wo.signcolumn = "yes"
-- 稳定窗口
vim.o.splitkeep = "screen"
vim.o.splitkeep = "topline"
