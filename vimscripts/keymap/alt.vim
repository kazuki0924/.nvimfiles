""""" {{ source

""" save & source init.vim
nnoremap <A-s> :w<esc>:so ~/.config/nvim/init.lua<CR>

""""" source }}



""""" {{ moving text

""" move text up/down
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv
inoremap <A-j> <Esc>:m .+1<CR>==a
inoremap <A-k> <Esc>:m .-2<CR>==a

""""" moving text }}



""""" {{ yank

""" yank the whole buffer
nnoremap <A-y> gg"+yG

""""" yank }}



""""" {{ paste

""" paste over the selected text from clipboard and send them to the blackhole
nnoremap <A-p> "_d"+p
vnoremap <A-p> "_d"+p
nnoremap <A-P> "_d"+P
vnoremap <A-P> "_d"+P

""""" paste }}
