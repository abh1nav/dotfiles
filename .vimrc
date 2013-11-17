" Pathogen
call pathogen#infect()

" Font size
set gfn=Menlo:h10

" Line numbers
set nu

" Highlighting
syntax on

" Indenting
filetype indent on
set autoindent
set tabstop=4
set shiftwidth=4

" Python indenting
let g:pyindent_continue = '&sw'

" Search options
set ic		" Case insensitive
set hls 	" Highlight search

" Wrap text
set lbr

" Colour scheme
colorscheme Monokai-Refined

" Automatically open NERDTree
" autocmd vimenter * NERDTree

" Tags
" set tags=~/.tags

" Java auto-complete
set complete=.,w,b,u,t,i

" Folding
" set foldmethod=indent

" Bells
set vb
