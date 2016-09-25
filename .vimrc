" Set encoding
set encoding=utf-8

" Set leader
let mapleader = ","

" Set Term properties
set t_Co=256
set term=xterm-256color
set termencoding=utf-8

" Pathogen
call pathogen#infect()

" GUI Font
set guifont=Droid\ Sans\ Mono\ for\ Powerline:h14

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

" NERDTree
" Automatically open NERDTree
" autocmd vimenter * NERDTree
" Even if no files were specified
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" NERDTree shortcuts
map <C-n> :NERDTreeToggle<CR>

" Folding
"set foldmethod=indent

" Bells
set vb

" Go
let g:go_fmt_command = "goimports"
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
" :Lint will run golint
set rtp+=$GOPATH/src/github.com/golang/lint/misc/vim
" :w will automatically run golint
autocmd BufWritePost,FileWritePost *.go execute 'Lint' | cwindow

" Remap autocomplete to C-space
inoremap <C-Space> <C-x><C-o>

" CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_user_command = 'find %s -type f'

" Airline configuration
" Enable the list of buffers across the top
let g:airline#extensions#tabline#enabled = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'
" Make airline appear even though there are no splits
set laststatus=2
" Fix fucked up fonts on OS X
let g:airline_powerline_fonts = 1

" MacVim Buffer Movement
" Tell macvim to skip it's own gvimrc
let macvim_skip_cmd_opt_movement = 1
" MacVim movement remaps
map <M-Right> :bn!<CR>
map <M-Left> :bp!<CR>

" Map ,+q to Bdelete (executed by vim-bbye)
nnoremap <Leader>q :Bdelete<CR>
