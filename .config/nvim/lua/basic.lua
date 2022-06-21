-- utf-8
vim.g.encoding = "UTF-8"
vim.o.fileencoding = "utf-8"
-- ues relative number line
vim.wo.number = true
vim.wo.relativenumber = true
-- hightlight current line
vim.wo.cursorline = true
-- the code of current line is too long, make a new line
vim.wo.colorcolumn = "80"
-- 2 space=one tab
vim.o.tabstop = 2
vim.bo.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftround = true
-- the length of >> <<
vim.o.shiftwidth = 2
vim.bo.shiftwidth = 2
-- replace space with tab
vim.o.expandtab = true
vim.bo.expandtab = true
-- the new line aligns the current line
vim.o.autoindent = true
vim.bo.autoindent = true
vim.o.smartindent = true
-- Searches are case insensitive unless they contain upper case
vim.o.ignorecase = true
vim.o.smartcase = true
-- 边输入边搜索
vim.o.incsearch = true
-- 命令行高为2，提供足够的显示空间
vim.o.cmdheight = 2
-- 当文件被外部程序修改时，自动加载
vim.o.autoread = true
vim.bo.autoread = true
-- 禁止折行
vim.wo.wrap = false
-- 光标在行首尾时<Left><Right>可以跳到下一行
vim.o.whichwrap = "<,>,[,]"
-- 允许隐藏被修改过的buffer
vim.o.hidden = true
-- 鼠标支持
vim.o.mouse = "a"
-- smaller updatetime
vim.o.updatetime = 300
-- 设置 timeoutlen 为等待键盘快捷键连击时间500毫秒，可根据需要设置
vim.o.timeoutlen = 1000
-- split window 从下边和右边出现
vim.o.splitbelow = true
vim.o.splitright = true
-- 自动补全不自动选中
vim.g.completeopt = "menu,menuone,noselect,noinsert"
-- 补全增强
vim.o.wildmenu = true
-- Dont' pass messages to |ins-completin menu|
vim.o.shortmess = vim.o.shortmess .. "c"
-- 补全最多显示10行
vim.o.pumheight = 10
-- 永远显示 tabline
vim.o.showtabline = 2
-- 使用增强状态栏插件后不再需要 vim 的模式提示
vim.o.showmode = false
