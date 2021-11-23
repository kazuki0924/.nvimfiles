package.path = package.path .. ";os.getenv('HOME') .. '/.nvinfiles/lua/'"
vim.cmd 'runtime! vimscripts/**/*.vim'

require 'options'
require 'settings'
require 'plugins'
