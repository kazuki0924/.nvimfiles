Plugins_List = {
  -- A use-package inspired plugin manager for Neovim
  -- packer.nvim can manage itself
  {'wbthomason/packer.nvim', opt = true},

  -- automatically install language servers
  {'williamboman/nvim-lsp-installer'},
  {'navarasu/onedark.nvim'}, -- Theme inspired by Atom

  {'tpope/vim-fugitive'}, -- Git commands in nvim
  {'tpope/vim-rhubarb'}, -- Fugitive-companion to interact with github
  {'tpope/vim-commentary'}, -- "gc" to comment visual regions/lines
  {'tpope/vim-surround'}, -- quoting
  -- {'ludovicchabant/vim-gutentags'}, -- Automatic tags management
  -- UI to select things (files, grep results, open buffers...)
  {'nvim-telescope/telescope.nvim', requires = {'nvim-lua/plenary.nvim'}},
  {'itchyny/lightline.vim'}, -- Fancier statusline
  -- Add indentation guides even on blank lines
  {'lukas-reineke/indent-blankline.nvim'},
  -- Add git related info in the signs columns and popups
  {'lewis6991/gitsigns.nvim', requires = {'nvim-lua/plenary.nvim'}},
  -- Highlight, edit, and navigate code using a fast incremental parsing library
  {'nvim-treesitter/nvim-treesitter'}, -- Additional textobjects for treesitter
  {'nvim-treesitter/nvim-treesitter-textobjects'},
  {'neovim/nvim-lspconfig'}, -- Collection of configurations for built-in LSP client
  {'hrsh7th/nvim-cmp'}, -- Autocompletion plugin
  {'hrsh7th/cmp-buffer'},
  {'hrsh7th/cmp-path'},
  {'hrsh7th/cmp-cmdline'},
  {'hrsh7th/cmp-nvim-lsp'},
  {'saadparwaiz1/cmp_luasnip'},
  {'L3MON4D3/LuaSnip'} -- Snippets pluginm
}

-- ensure packer.nvim is insalled
local install_path = vim.fn.stdpath('data') ..
                       '/site/pack/packer/opt/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.cmd('!git clone https://github.com/wbthomason/packer.nvim ' ..
            install_path)
end

vim.api.nvim_exec([[
  augroup Packer
    autocmd!
    autocmd BufWritePost init.lua PackerCompile
  augroup end
]], false)

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
  for _, v in pairs(Plugins_List) do
    use(v)
  end
end)

-- auto compile when there are changes in plugins.lua
vim.cmd [[ autocmd BufWritePost plugins.lua PackerCompile ]]
