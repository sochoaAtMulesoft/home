" Mode changing with common keys
inoremap JJ <Esc>
inoremap Jj <Esc>
inoremap jj <Esc>
inoremap jk <Esc>

" Slight navigation changes to reduce hand movement
noremap l h
noremap ; l

" Navigation adjustment when lines wrap
nnoremap j gj
nnoremap k gk
set nowrap
set backspace=indent,eol,start
