-- set leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opt = {
	noremap = true,
	silent = true,
}

-- local variable
local map = vim.api.nvim_set_keymap

-- cancel  the function of default "s" key
map("n", "s", "", opt)
-- the shortcut of window

map("i", "jk", "<Esc>", opt)

map("n", "sv", ":vsp<CR>", opt)
map("n", "sh", ":sp<CR>", opt)
-- close current window
map("n", "sc", "<C-W>c", opt)
-- close other widnws
map("n", "so", "C-w>o", opt)
-- Ctrl + hjkl jump to other windows
map("n", "<C-h>", "<C-w>h", opt)
map("n", "<C-j>", "<C-w>j", opt)
map("n", "<C-l>", "<C-w>l", opt)
map("n", "<C-k>", "<C-w>k", opt)
-- control the window's size of left/right
map("n", "s,", ":vertical resize -2<CR>", opt)
map("n", "s.", ":vertical resize +2<CR>", opt)
-- control the window's size of down/up
map("n", "sj", ":resize +2<CR>", opt)
map("n", "sk", ":resize -2<CR>", opt)
-- equal proportion
map("n", "s=", "<C-w>=", opt)

-- about Terminal
map("n", "<leader>t", ":terminal<CR>", opt)
--map("n", "<leader>t", ":sp | terminal<CR>", opt)
--map("n", "<leader>vt", ":vsp | terminal<CR>", opt)
map("t", "<C-q>", "<C-\\><C-n>", opt)
map("t", "<C-h>", [[ <C-\><C-N><C-w>h ]], opt)
map("t", "<C-j>", [[ <C-\><C-N><C-w>j ]], opt)
map("t", "<C-k>", [[ <C-\><C-N><C-w>k ]], opt)
map("t", "<C-l>", [[ <C-\><C-N><C-w>l ]], opt)

-- in v'mode retract code
map("v", "<", "<gv", opt)
map("v", ">", ">gv", opt)
-- J/K move the text are selected
map("v", "K", ":move '<-2<CR>gv-gv", opt)
map("v", "J", ":move '>+1<CR>gv-gv", opt)
-- Ctrl + d/u move 4j/k
map("n", "<C-d>", "4j", opt)
map("n", "<C-u>", "4k", opt)

-- shortcut of plugin
local pluginKeys = {}
-- nvim-tree
-- <space> + m open/close filetree
map("n", "<leader>m", ":NvimTreeToggle<CR>", opt)
-- shortcut list
pluginKeys.nvimTreeList = {
	-- 打开文件或文件夹
	{ key = { "<CR>", "<2-LeftMouse>" }, action = "edit" },
	-- 分屏打开文件
	{ key = "<leader>v", action = "vsplit" },
	{ key = "<leader>h", action = "split" },
	-- 显示隐藏文件
	{ key = "i", action = "toggle_custom" }, -- 对应 filters 中的 custom (node_modules)
	{ key = ".", action = "toggle_dotfiles" }, -- Hide (dotfiles)
	-- 文件操作
	{ key = "<leader>r", action = "refresh" },
	{ key = "a", action = "create" },
	{ key = "d", action = "remove" },
	{ key = "r", action = "rename" },
	{ key = "x", action = "cut" },
	{ key = "c", action = "copy" },
	{ key = "p", action = "paste" },
	{ key = "o", action = "system_open" },
	-- 进入下一级
	{ key = { "]" }, action = "cd" },
	-- 进入上一级
	{ key = { "[" }, action = "dir_up" },
}

-- bufferline
-- 左右Tab切换 map("n", "<leader>h", ":BufferLineCyclePrev<CR>", opt)
map("n", "<leader>l", ":BufferLineCycleNext<CR>", opt)
-- 关闭
--"moll/vim-bbye"
map("n", "<leader>w", ":Bdelete!<CR>", opt)
map("n", "<leader>bl", ":BufferLineCloseRight<CR>", opt)
map("n", "<leader>bh", ":BufferLineCloseLeft<CR>", opt)
map("n", "<leader>bc", ":BufferLinePickClose<CR>", opt)

-- Telescope
-- 查找文件
map("n", "<leader>p", ":Telescope find_files<CR>", opt)
-- 全局搜索
map("n", "<leader>s", ":Telescope live_grep<CR>", opt)
-- Telescope 列表中 插入模式快捷键
pluginKeys.telescopeList = {
	i = {
		-- 上下移动
		["<C-j>"] = "move_selection_next",
		["<C-k>"] = "move_selection_previous",
		["<Down>"] = "move_selection_next",
		["<Up>"] = "move_selection_previous",
		-- 历史记录
		["<C-n>"] = "cycle_history_next",
		["<C-p>"] = "cycle_history_prev",
		-- 关闭窗口
		["<C-c>"] = "close",
		-- 预览窗口上下滚动
		["<C-u>"] = "preview_scrolling_up",
		["<C-d>"] = "preview_scrolling_down",
	},
}

-- nvim-cmp 自动补全
pluginKeys.cmp = function(cmp)
	return {
		-- 出现补全
		["<leader>."] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
		-- 取消
		["<leader>,"] = cmp.mapping({
			i = cmp.mapping.abort(),
			c = cmp.mapping.close(),
		}),
		-- 上一个
		["<C-k>"] = cmp.mapping.select_prev_item(),
		-- 下一个
		["<C-j>"] = cmp.mapping.select_next_item(),
		-- 确认
		["<CR>"] = cmp.mapping.confirm({
			select = true,
			behavior = cmp.ConfirmBehavior.Replace,
		}),
		-- 如果窗口内容太多，可以滚动
		["<C-u>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
		["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
	}
end
-- lsp 回调函数快捷键设置
pluginKeys.mapLSP = function(mapbuf)
	-- rename
	--[[
  -- Lspsaga 替换 rn
  -- mapbuf("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opt)
  --]]
	mapbuf("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opt)
	-- code action
	--[[
  Lspsaga 替换 ca
  mapbuf("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opt)
  --]]
	mapbuf("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opt)
	-- go xx
	--[[
    mapbuf('n', 'gd', '<cmd>Lspsaga preview_definition<CR>', opt)
  --]]
	mapbuf("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opt)
	--[[
  Lspsaga 替换 gh
  mapbuf("n", "gh", "<cmd>lua vim.lsp.buf.hover()<CR>", opt)
  --]]
	mapbuf("n", "gh", "<cmd>Lspsaga hover_doc<cr>", opt)
	--[[
  Lspsaga 替换 gr
  mapbuf("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opt)
  --]]
	mapbuf("n", "gr", "<cmd>Lspsaga lsp_finder<CR>", opt)
	--[[
  Lspsaga 替换 gp, gj, gk
  mapbuf("n", "gp", "<cmd>lua vim.diagnostic.open_float()<CR>", opt)
  mapbuf("n", "gj", "<cmd>lua vim.diagnostic.goto_next()<CR>", opt)
  mapbuf("n", "gk", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opt)
  --]]
	-- diagnostic
	mapbuf("n", "gp", "<cmd>Lspsaga show_line_diagnostics<CR>", opt)
	mapbuf("n", "gj", "<cmd>Lspsaga diagnostic_jump_next<cr>", opt)
	mapbuf("n", "gk", "<cmd>Lspsaga diagnostic_jump_prev<cr>", opt)
	mapbuf("n", "<leader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opt)
	-- 未用
	-- mapbuf("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opt)
	-- mapbuf("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opt)
	-- mapbuf('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opt)
	-- mapbuf("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opt)
	-- mapbuf('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opt)
	-- mapbuf('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opt)
	-- mapbuf('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opt)
	-- mapbuf('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opt)
end
pluginKeys.mapVimspector = function()
	-- 开始
	map("n", "<leader>dd", ":call vimspector#Launch()<CR>", opt)
	-- 结束
	map("n", "<Leader>de", ":call vimspector#Reset()<CR>", opt)
	-- 继续
	map("n", "<Leader>dc", ":call vimspector#Continue()<CR>", opt)
	-- 设置断点
	map("n", "<Leader>dt", ":call vimspector#ToggleBreakpoint()<CR>", opt)
	map("n", "<Leader>dT", ":call vimspector#ClearBreakpoints()<CR>", opt)
	--  stepOver, stepOut, stepInto
	map("n", "<leader>dj", "<Plug>VimspectorStepOver", opt)
	map("n", "<leader>dk", "<Plug>VimspectorStepOut", opt)
	map("n", "<leader>dl", "<Plug>VimspectorStepInto", opt)
end
-- 代码注释插件
-- -- see ./lua/plugin-config/comment.lua
pluginKeys.comment = {
	-- Normal 模式快捷键
	toggler = {
		line = "<leader>cc", -- 行注释
		block = "<leader>bc", -- 块注释
	},
	-- Visual 模式
	opleader = {
		line = "<leader>c",
		bock = "<leader>b",
	},
}
return pluginKeys
