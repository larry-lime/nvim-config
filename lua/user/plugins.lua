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
  use { "nvim-treesitter/nvim-treesitter" }

  -- Colorschemes
  use { "ful1e5/onedark.nvim" }
  use { "ellisonleao/gruvbox.nvim" }
  use { "folke/tokyonight.nvim" }
  use { "kyazdani42/nvim-web-devicons" }

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
  use { 'jubnzv/mdeval.nvim' }
  use { 'abecodes/tabout.nvim' }
  use { "Pocco81/auto-save.nvim" }
  use { "nyngwang/NeoZoom.lua" }
  use { "lukas-reineke/indent-blankline.nvim" }
  use { "nvim-neorg/neorg", requires = "wbthomason/packer.nvim" }
  use { "folke/trouble.nvim", requires = "kyazdani42/nvim-web-devicons" }
  use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install",
    setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })
  use { "tpope/vim-obsession" }

  -- Debugger
  -- use { "vimwiki/vimwiki" }
  use { "mfussenegger/nvim-dap" }
  use { "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } }
  use { "mfussenegger/nvim-dap-python" }
  -- use { "mxsdev/nvim-dap-vscode-js", requires = { "mfussenegger/nvim-dap" } }

  -- Plugin Graveyard
  -- use { "catppuccin/nvim", as = "catppuccin" }
  -- use { 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim' }

  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
