--basic options
require("basic")
--shortcut options
require("keybindings")
-- Packer: plugins control
require("plugins")
-- colorscheme
require("colorscheme")
-- plugin-config
require("plugin-config.nvim-tree")
require("plugin-config.bufferline")
require("plugin-config.lualine")
require("plugin-config.telescope")
require("plugin-config.dashboard")
require("plugin-config.project")
require("plugin-config.nvim-treesitter")
require("plugin-config.indent-blankline")
-- LSP
require("lsp.setup")
require("lsp.cmp")
require("lsp.ui")
-- LSP.format
require("lsp.null-ls")
-- debug
require("dap.vimspector") -- lua/dap/vimspector/init.lua
