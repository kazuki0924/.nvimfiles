local plugins = {
  -- A use-package inspired plugin manager for Neovim
  -- packer.nvim can manage itself
  {'wbthomason/packer.nvim', opt = true},

  -- A Dark Theme for neovim >= 0.5 based on Atom One Dark Theme written in lua with TreeSitter syntax highlight.
  {'navarasu/onedark.nvim'},

  -- Lua port of the most famous vim colorscheme
  -- {'ellisonleao/gruvbox.nvim', requires = {'rktjmp/lush.nvim'}},
	
	-- { 'neovim/nvim-lspconfig' },
	-- { 'kabouzeid/nvim-lspinstall' },
	-- { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' },

  {'tpope/vim-commentary', keys = 'gc'},

  -- indent guides for neovim
  { "lukas-reineke/indent-blankline.nvim" }
}

-- ensure packer.nvim is insalled
local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/opt/packer.nvim"
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.cmd("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
end

-- Only required if you have packer configured as `opt`
vim.cmd [[ packadd packer.nvim ]]

local ok, packer = pcall(require, 'packer')
if not ok then
  return
end

packer.init({
  display = {
    open_fn = function()
      return require('packer.util').float {border = 'single'}
    end
  }
})

packer.startup(function(use)
  for _, v in pairs(plugins) do
    use(v)
  end
end)

-- auto compile when there are changes in plugins.lua
vim.cmd [[ autocmd BufWritePost plugins.lua PackerCompile ]]
