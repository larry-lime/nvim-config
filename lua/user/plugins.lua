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
  use { "nvim-lua/popup.nvim" }
  use { "nvim-lua/plenary.nvim" }
  use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }

  -- Colorschemes
  use { "ful1e5/onedark.nvim" }
  use { "ellisonleao/gruvbox.nvim" }
  use { "folke/tokyonight.nvim" }
  use { "catppuccin/nvim", as = "catppuccin" }

  -- IDE Features
  use { "nvim-lualine/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons", opt = true } }
  use { "numToStr/Comment.nvim" }
  use { "kyazdani42/nvim-tree.lua", requires = { "kyazdani42/nvim-web-devicons" } }
  use { "windwp/nvim-autopairs" }
  use { "akinsho/toggleterm.nvim", tag = "v1.*" }
  use { 'simrat39/symbols-outline.nvim' }
  use { "fedepujol/move.nvim" }

  -- LSP
  use { "neovim/nvim-lspconfig" }
  use { "hrsh7th/cmp-nvim-lsp" }
  use { "williamboman/nvim-lsp-installer" }
  use { "github/copilot.vim" }
  use { 'jose-elias-alvarez/null-ls.nvim' }
  -- TODO set this up. I'll have to reconfigure my entire LSP setup
  use { "lukas-reineke/lsp-format.nvim" }
  use { "sbdchd/neoformat" }

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
  use { "tpope/vim-fugitive" }

  -- Telescope
  use { "nvim-telescope/telescope.nvim", requires = { { "nvim-lua/plenary.nvim" } } }
  use { "nvim-telescope/telescope-ui-select.nvim" }
  use { "ThePrimeagen/harpoon" }
  use { "ThePrimeagen/refactoring.nvim",
    requires = { { "nvim-lua/plenary.nvim" }, { "nvim-treesitter/nvim-treesitter" } } }

  -- Add-Ons
  use { 'stevearc/aerial.nvim' }
  use { "tpope/vim-obsession" }
  use { "lukas-reineke/indent-blankline.nvim" }
  use { 'abecodes/tabout.nvim' }
  use { "norcalli/nvim-colorizer.lua" }
  use { "Pocco81/AutoSave.nvim" }

  -- New Plugins
  use { 'stevearc/dressing.nvim' }
  use { "folke/trouble.nvim", requires = "kyazdani42/nvim-web-devicons" }
  -- Debugger
  -- use { "vimwiki/vimwiki" }
  -- use { "mfussenegger/nvim-dap" }
  -- use { "mfussenegger/nvim-dap-python" }
  -- use { "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } }

  -- Plugin Graveyard
  -- use { "junegunn/goyo.vim" }
  -- use { "lewis6991/impatient.nvim" }
  -- use { "preservim/tagbar" }
  -- use { "j-hui/fidget.nvim" }


  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
