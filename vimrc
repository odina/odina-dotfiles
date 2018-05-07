" pathogen first
execute pathogen#infect()

let mapleader="\<Space>"
let g:airline#extensions#tabline#enabled = 1
let g:ctrlp_map = '<leader>o'
let g:ctrlp_cmd = 'CtrlP'

" alternative escape key
inoremap jk <ESC>

" allow filetype plugins
filetype plugin on

" allow smart indentations for different files
filetype plugin indent on

" syntax highlighting
syntax on

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf-8

" case-insensitive search
set ignorecase

" highlight when searching
set hlsearch

" show line numbers
set number

" infinite undo
" http://ideasintosoftware.com/history-is-a-tree/
set undofile
set undodir=~/.vim/undodir

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" tabs, spaces, indents
set expandtab
set shiftwidth=2
set tabstop=2

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

" always remove trailing whitespaces
autocmd BufWritePre * :%s/\s\+$//e

""""""""""""""
" Shortcuts
""""""""""""""
" nmap <leader>gb :Gblame<cr>
nmap <leader>n :NERDTreeToggle<cr>

" remap tcomment toggle
nmap <leader>/ gcc
vmap <leader>/ gcc

" split screen
nmap <leader>v :vsplit<cr>
nmap <leader>h :split<cr>

" git blame
nmap <leader>gb :Gblame<cr>

""""""""""""""""""""
" Airline Buffers
""""""""""""""""""""
" Move to the next buffer
nmap <leader>l :bnext<CR>

" Move to the previous buffer
nmap <leader>k :bprevious<CR>

" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nmap <leader>bq :bp <BAR> bd #<CR>

" Show all open buffers and their status
nmap <leader>bl :ls<CR>

" Make Ctrl-P faster for git projects
let g:ctrlp_use_caching = 0
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor

  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
else
  let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
  let g:ctrlp_prompt_mappings = {
      \ 'AcceptSelection("e")': ['<space>', '<cr>', '<2-LeftMouse>'],
      \ }
endif

" Tabs for different filetypes
au Filetype javascript setl ts=2 sts=2 sw=2
au Filetype python setl et ts=4 sw=4

" replace ack with ag (silver_searcher)
let g:ackprg = 'ag --nogroup --nocolor --column'


" .wsgi files set to pyhton
au BufRead,BufNewFile *.wsgi setfiletype python

" .tag files set to html
au BufRead,BufNewFile *.tag setfiletype html
