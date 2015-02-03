" Set leader
let mapleader = ","

" Pathogen
call pathogen#infect()

" Font size
set gfn=Droid\ Sans\ Mono\ 10

" Line numbers
set nu

" Highlighting
syntax on

" Indenting
filetype indent on
set autoindent
set tabstop=4
set shiftwidth=4
set expandtab

" Filetype plugins
filetype plugin on

" Python indenting
let g:pyindent_continue = '&sw'

" Search options
set ic		" Case insensitive
set hls 	" Highlight search

" Wrap text
set lbr

" Enable mouse-foo
set mouse=a

" Colour scheme
colorscheme Monokai-Refined

" Automatically open NERDTree
autocmd vimenter * NERDTree
" Even if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" NERDTree shortcuts
map <C-n> :NERDTreeToggle<CR>

" Tags
" set tags=~/.tags

" Java auto-complete
set complete=.,w,b,u,t,i

" Folding
" set foldmethod=indent

" Bells
set vb

" Quick edit and reload vimrc
nnoremap <Leader>ev :e ~/.vimrc<CR>
nnoremap <Leader>rv :source ~/.vimrc<CR>

" Go
"let g:go_fmt_command = "goimports"
"let g:go_highlight_functions = 1
"let g:go_highlight_methods = 1
"let g:go_highlight_structs = 1

" Syntastic
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0

" Remap autocomplete to C-space
inoremap <C-Space> <C-x><C-o>
