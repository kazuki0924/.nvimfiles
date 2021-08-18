vim.cmd [[ packadd packer.nvim ]]

local plugins = {
  {'wbthomason/packer.nvim', opt = true}, {'morhetz/gruvbox'},
  {'tpope/vim-commentary', keys = 'gc'}
}

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
vim.cmd 'autocmd BufWritePost plugins.lua PackerCompile'
