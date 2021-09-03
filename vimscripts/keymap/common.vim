""""" {{ cursor

""" move cursor to beginning/end of the line
nnoremap L $
nnoremap H ^

""""" cursor }}


""""" {{ yank

""" yank non-blank character of the line
nnoremap Y yg_

""""" yank }}



""""" {{ delete

""" delete to void
nnoremap <leader>x "_d
vnoremap <leader>x "_d
nnoremap x "_x
vnoremap x "_x
nnoremap X "_X
vnoremap X "_X

""""" delete }}



""""" {{ clipboard

""" yank to clipboard
nnoremap <leader>y "+y
vnoremap <leader>y "+y

""" delete to clipboard
nnoremap <leader>d "+d
vnoremap <leader>d "+d

""""" clipboard }}



""""" {{ paste

""" paste over a selected text and send them to the blackhole
xnoremap <leader>p "_dP


""""" paste }}



""""" {{ new line

""" insert new line above and below cursor
nnoremap <leader>o mxo<esc>0"_Dg`x
nnoremap <leader>O mxO<esc>0"_Dg`x

""""" new line }}
