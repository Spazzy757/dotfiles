local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

require('packer').startup(function(use)

  use 'wbthomason/packer.nvim'
  use 'nvim-tree/nvim-tree.lua'
  use 'junegunn/vim-easy-align'
  use 'nvim-tree/nvim-web-devicons'
  use 'hashivim/vim-terraform'
  use 'rust-lang/rust.vim'
  use 'mattn/webapi-vim'
  use 'ekalinin/Dockerfile.vim'
  use 'ray-x/go.nvim'
  use 'ray-x/guihua.lua'
  use 'williamboman/nvim-lsp-installer'
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/vim-vsnip'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'nvim-treesitter/nvim-treesitter'
  use 'tpope/vim-fugitive'
  use 'shime/vim-livedown'

  if packer_bootstrap then
    require('packer').sync()
  end
end)
