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
  use "wbthomason/packer.nvim"
  use "nvim-lua/popup.nvim" 
  use "jiangmiao/auto-pairs"
  use "nvim-lua/plenary.nvim"

  -- Dashboard --
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

  -- Obsidian --
  use "epwalsh/obsidian.nvim"

  -- Wilder --
  use "gelguy/wilder.nvim"
  
  -- Telescope --
  use {
    'nvim-telescope/telescope.nvim', 
    tag = '0.1.5',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- Git --
  use "lewis6991/gitsigns.nvim"
  
  -- Treesitter --
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }
  use "p00f/nvim-ts-rainbow"
  use "fladson/vim-kitty"
  use "camnw/lf-vim"

  -- NVimTree --
  use "nvim-tree/nvim-web-devicons"
  use "nvim-tree/nvim-tree.lua"

  -- Bufferline --
  use "akinsho/bufferline.nvim"
  use "moll/vim-bbye"
  
  -- Color Schemes --
  use "mhartington/oceanic-next"
  use "folke/tokyonight.nvim"
  use "nvim-lualine/lualine.nvim"
  use "xiyaowong/transparent.nvim"

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)