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

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

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

-- Install your plugins here
return packer.startup(function(use)
  use "akinsho/bufferline.nvim"
  use "akinsho/toggleterm.nvim"
  use 'andweeb/presence.nvim'
  use "camnw/lf-vim"
  use "fladson/vim-kitty"
  use "folke/tokyonight.nvim"
  use "gelguy/wilder.nvim"
  use "HiPhish/rainbow-delimiters.nvim"
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-cmdline"
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-nvim-lua"
  use "hrsh7th/cmp-path"
  use "hrsh7th/nvim-cmp"
  use "jiangmiao/auto-pairs"
  use "jose-elias-alvarez/null-ls.nvim"
  use "L3MON4D3/LuaSnip"
  use "lewis6991/gitsigns.nvim"
  use "lukas-reineke/indent-blankline.nvim"
  use "moll/vim-bbye"
  use "mhartington/oceanic-next"
  use "neovim/nvim-lspconfig"
  use "nvim-lua/plenary.nvim"
  use "nvim-lua/popup.nvim"
  use "nvim-lualine/lualine.nvim"
  use "nvim-tree/nvim-web-devicons"
  use "nvim-tree/nvim-tree.lua"
  use "saadparwaiz1/cmp_luasnip"
  use "tpope/vim-commentary"
  use "wbthomason/packer.nvim"
  use "williamboman/mason.nvim"
  use "williamboman/mason-lspconfig.nvim"
  use "xiyaowong/transparent.nvim"


  use {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    requires = { {"nvim-tree/nvim-web-devicons"} }
  }

  use {
    'goolord/alpha-nvim',
    config = function ()
        require'alpha'.setup(require'alpha.themes.dashboard'.config)
    end
  } 
  
  use {
    'nvim-telescope/telescope.nvim', 
    tag = '0.1.5',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
