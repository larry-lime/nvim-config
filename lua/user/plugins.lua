--     ____  __            _
--    / __ \/ /_  ______ _(_)___  _____
--   / /_/ / / / / / __ `/ / __ \/ ___/
--  / ____/ / /_/ / /_/ / / / / (__  )
-- /_/   /_/\__,_/\__, /_/_/ /_/____/
--               /____/
local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

return packer.startup(function(use)
  -- Core Plugins
  use { "wbthomason/packer.nvim" }
  use { 'jose-elias-alvarez/null-ls.nvim' }
  use { "nvim-lua/popup.nvim" }
  use { "nvim-lua/plenary.nvim" }
  use { "nvim-treesitter/nvim-treesitter" }

  -- Colorschemes
  use { "navarasu/onedark.nvim" }
  use { 'tanvirtin/monokai.nvim' }
  use 'shaunsingh/nord.nvim'
  use { "catppuccin/nvim", as = "catppuccin" }
  use { "ellisonleao/gruvbox.nvim" }
  use { "folke/tokyonight.nvim" }
  use { "kyazdani42/nvim-web-devicons" }

  -- IDE Features
  use { 'akinsho/bufferline.nvim', tag = "v3.*", requires = 'nvim-tree/nvim-web-devicons' }
  use { "nvim-lualine/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons", opt = true } }
  use { "numToStr/Comment.nvim" }
  use { "kyazdani42/nvim-tree.lua", requires = { "kyazdani42/nvim-web-devicons" } }
  use { "windwp/nvim-autopairs" }
  use { 'fedepujol/move.nvim' }
  use { 'rmagatti/auto-session' }

  -- LSP
  use { "williamboman/mason.nvim" }
  use { "williamboman/mason-lspconfig.nvim" }
  use { "neovim/nvim-lspconfig" }
  use { "hrsh7th/cmp-nvim-lsp" }
  -- TODO: Update this to copilot lua
  use { "github/copilot.vim" }
  use {
    "SmiteshP/nvim-navic",
    requires = "neovim/nvim-lspconfig"
  }

  -- CMP
  use { "hrsh7th/nvim-cmp" }
  use { "hrsh7th/cmp-buffer" }
  use { "hrsh7th/cmp-path" }
  use { "hrsh7th/cmp-cmdline" }
  use { "hrsh7th/cmp-nvim-lua" }

  -- Snippets
  use { "saadparwaiz1/cmp_luasnip" }
  use { "rafamadriz/friendly-snippets" }
  use { "L3MON4D3/LuaSnip" }

  -- Git
  use { "lewis6991/gitsigns.nvim" }

  -- Telescope
  use { "nvim-telescope/telescope.nvim", requires = { { "nvim-lua/plenary.nvim" } } }
  use { "nvim-telescope/telescope-ui-select.nvim" }
  use { "max397574/colortils.nvim" }
  use { 'norcalli/nvim-colorizer.lua' }


  -- Debugger
  use { "mfussenegger/nvim-dap" }
  use { "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } }
  -- Lua
  use { "folke/zen-mode.nvim" }

  -- Add ons
  use { "tiagovla/scope.nvim" }
  use { 'stevearc/aerial.nvim' }
  use { 'simrat39/symbols-outline.nvim' }
  use { "windwp/nvim-spectre" }
  use { 'abecodes/tabout.nvim' }
  use { "nyngwang/NeoZoom.lua" }
  use { "lukas-reineke/indent-blankline.nvim" }
  use { "folke/trouble.nvim", requires = "kyazdani42/nvim-web-devicons" }
  use({
    "iamcco/markdown-preview.nvim",
    run = "cd app && npm install",
    setup = function() vim.g.mkdp_filetypes = { "markdown" } end,
    ft = { "markdown" },
  })
  use {
    'andymass/vim-matchup',
    setup = function()
      -- may set any options here
      vim.g.matchup_matchparen_offscreen = { method = "popup" }
    end
  }
  use {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
  }
  use { 'rcarriga/nvim-notify' }
  use { "tpope/vim-fugitive" }
  use { "vimwiki/vimwiki" }

  -- Plugin Graveyard
  -- use { 'codota/tabnine-nvim', run = "./dl_binaries.sh" }
  -- use { 'nanotee/sqls.nvim' }
  -- use { 'jubnzv/mdeval.nvim' }
  -- use 'nanotee/sqls.nvim'
  -- use { "nacro90/numb.nvim" }
  -- use "stevearc/dressing.nvim"
  -- use {'karb94/neoscroll.nvim'}
  -- use { 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim' }
  -- use { "nvim-neorg/neorg", requires = "wbthomason/packer.nvim" }
  -- use { 'simrat39/symbols-outline.nvim' }
  -- use { "williamboman/nvim-lsp-installer" }
  -- use { "RRethy/vim-illuminate" }
  -- use { "akinsho/toggleterm.nvim", tag = "v1.*" }
  -- use { 'goolord/alpha-nvim' }
  -- use { "mfussenegger/nvim-dap-python" }
  -- use { "mxsdev/nvim-dap-vscode-js", requires = { "mfussenegger/nvim-dap" } }
  -- use { 'phaazon/hop.nvim', branch = 'v2' }
  -- use({ "Pocco81/auto-save.nvim" })
  -- use { 'lervag/vimtex' }
  use { "ThePrimeagen/harpoon" }
  -- use({
  --   "folke/noice.nvim",
  --   requires = {
  --     "MunifTanjim/nui.nvim",
  --     "rcarriga/nvim-notify",
  --   }
  -- })
  -- use { "ThePrimeagen/refactoring.nvim",
  --   requires = { { "nvim-lua/plenary.nvim" }, { "nvim-treesitter/nvim-treesitter" } } }

  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
