syntax on
" set smartindent
" set smartcase
" set backspace=indent,eol,start
" set complete-=i
" set smarttab
" set nrformats-=octal
" set incsearch
" set hlsearch
" set laststatus=2
" set wildmenu
" set scrolloff=8
" set sidescrolloff=5
" set autoread
" set history=1000
" set tabpagemax=50
" set ruler
" set sessionoptions-=options
" set viewoptions-=options
" set noerrorbells
" set tabstop=2 softtabstop=2
" set shiftwidth=2
" set expandtab
" set nu
" set relativenumber
" set nowrap
" set noswapfile
" set nobackup
" set undodir=~/.vim/undodir
" set undofile
" set exrc
" set hid
" set signcolumn=yes
set termguicolors
" set cmdheight=2
" set colorcolumn=80
hi ColorColumn ctermbg=0 guibg=lightgrey
if !empty(&viminfo)
  set viminfo^=!
endif

" call plug#begin('~/.config/nvim/autoload/plugged')

" let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
" if empty(glob(data_dir . '/autoload/plug.vim'))
"   silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
"   autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
" endif

" Plug 'morhetz/gruvbox'
" call plug#end()

colorscheme gruvbox
set background=dark
hi Normal ctermbg=NONE guibg=NONE
hi LineNr ctermbg=NONE guibg=NONE
hi SignColumn ctermbg=NONE guibg=NONE

augroup AutoReloadVimrc 
  autocmd! BufWritePost $MYVIMRC source $MYVIMRC
augroup END

" EoB cannot set to be transparent, thus changed to black for alternative
hi! EndOfBuffer guifg=black
