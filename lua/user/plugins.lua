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
  use { "wbthomason/packer.nvim" }
  use { "nvim-lua/popup.nvim" }
  use { "nvim-lua/plenary.nvim" }
  use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }
  use { "ellisonleao/gruvbox.nvim" }
  use { "folke/tokyonight.nvim" }
  use { "catppuccin/nvim", as = "catppuccin" }
  use { "ful1e5/onedark.nvim" }
  use { "nvim-lualine/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons", opt = true } }
  use { "akinsho/toggleterm.nvim", tag = "v1.*" }
  use { "hrsh7th/nvim-cmp" }
  use { "hrsh7th/cmp-buffer" }
  use { "hrsh7th/cmp-path" }
  use { "hrsh7th/cmp-cmdline" }
  use { "hrsh7th/cmp-nvim-lua" }
  use { "numToStr/Comment.nvim" }
  use { "preservim/tagbar" }
  use { "Pocco81/AutoSave.nvim" }
  use { "fedepujol/move.nvim" }
  use { "mfussenegger/nvim-dap" }
  use { "mfussenegger/nvim-dap-python" }
  use { "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } }
  use { "nvim-telescope/telescope.nvim", requires = { { "nvim-lua/plenary.nvim" } } }
  use { "nvim-telescope/telescope-ui-select.nvim" }
  use { "ThePrimeagen/harpoon" }
  use { "ThePrimeagen/refactoring.nvim", requires = { { "nvim-lua/plenary.nvim" }, { "nvim-treesitter/nvim-treesitter" } } }
  use { "kyazdani42/nvim-tree.lua", requires = { "kyazdani42/nvim-web-devicons" } }
  use { "saadparwaiz1/cmp_luasnip" }
  use { "L3MON4D3/LuaSnip" }
  use { "rafamadriz/friendly-snippets" }
  use { "neovim/nvim-lspconfig" }
  use { "hrsh7th/cmp-nvim-lsp" }
  use { "williamboman/nvim-lsp-installer" }
  use { "windwp/nvim-autopairs" }
  use { "junegunn/goyo.vim" }
  use { "lewis6991/gitsigns.nvim" }
  use { "tpope/vim-fugitive" }
  use { "tpope/vim-obsession" }
  use { "vimwiki/vimwiki"}
  use { "github/copilot.vim"}
  -- use { "zbirenbaum/copilot.lua", }
  -- use { "zbirenbaum/copilot-cmp", module = "copilot_cmp", }
  -- use { "gbrlsnchs/telescope-lsp-handlers.nvim" }

  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
