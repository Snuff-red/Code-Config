local packer = require("packer")

packer.startup({
	function(use)
		-- Packer control self
		use("wbthomason/packer.nvim")
		-- my plugins
		-- colorscheme
		use("EdenEast/nightfox.nvim")
		-- nerd-tree
		use("kyazdani42/nvim-tree.lua")
		use("kyazdani42/nvim-web-devicons")
		-- buggerline
		use("akinsho/bufferline.nvim")
		use({ "moll/vim-bbye", tag = "v2.*" })
		-- lualine
		use("nvim-lualine/lualine.nvim")
		use("arkav/lualine-lsp-progress")
		-- telescope
		use("nvim-telescope/telescope.nvim")
		use("nvim-lua/plenary.nvim")
		-- dashboard
		use("glepnir/dashboard-nvim")
		-- project
		use("ahmedkhalf/project.nvim")
		-- Tree-sitter
		use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
		-- lsp
		use("neovim/nvim-lspconfig")
		use("williamboman/nvim-lsp-installer")
		-- 补全引擎
		use("hrsh7th/nvim-cmp")
		-- snippet 引擎
		use("hrsh7th/vim-vsnip")
		-- 补全源
		use("hrsh7th/cmp-vsnip")
		use("hrsh7th/cmp-nvim-lsp") -- { name = nvim_lsp }
		use("hrsh7th/cmp-buffer") -- { name = 'buffer' },
		use("hrsh7th/cmp-path") -- { name = 'path' }
		use("hrsh7th/cmp-cmdline") -- { name = 'cmdline' }
		-- common code fragment
		use("rafamadriz/friendly-snippets")
		-- lsp-ui
		use("onsails/lspkind.nvim")
		use("tami5/lspsaga.nvim")
		-- inden-blankline
		use("lukas-reineke/indent-blankline.nvim")
		-- code format
		use("jose-elias-alvarez/null-ls.nvim")
		use("nvim-lua/plenary.nvim")
		-- JSON plus
		use("b0o/schemastore.nvim")
		-- supplement
		use("lewis6991/gitsigns.nvim")
		-- debug
		-- vimspector
		use("puremourning/vimspector")
	end,

	-- config
	config = {
		display = {
			open_fn = function()
				return require("packer.util").float({ border = "single" })
			end,
		},
	},
})

-- everytime written the plugins.lua(file), auto execute :PackerSync
pcall(
	vim.cmd,
	[[
    augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
  ]]
)
