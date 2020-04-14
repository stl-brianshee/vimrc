" Setting up Vundle
set nocompatible
filetype off

" runtime path should include Vundle and initialize.
set runtimepath+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Vundle should manage Vundle
Plugin 'gmarik/Vundle.vim'
Plugin 'dense-analysis/ale'

" A folding plugin.
" Plugin 'tmhedberg/SimpylFold' -> Terrible with large files

" Python indentation
Plugin 'vim-scripts/indentpython.vim'

call vundle#end()
filetype plugin indent on

syntax enable

" Set color column.
set colorcolumn=99

set encoding=utf-8

set ruler
set number

" See status
set laststatus=2
set cmdheight=2

" Less blinding
colorscheme desert

set ignorecase
set smartcase

set expandtab

set hlsearch
set incsearch

" Enable folding
set foldmethod=indent
set foldlevel=99
" Shortcut the toggle
nnoremap <space> za

set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent

" Python indentation, PEP 8
au FileType py
    \ setlocal tabstop=4 |
    \ setlocal softtabstop=4 |
    \ setlocal shiftwidth=4 |
    \ setlocal textwidth=99 |
    \ setlocal expandtab |
    \ setlocal autoindent |
    \ setlocal fileformat=unix

" Frontend development
au FileType js,javascript,html,css,less
    \ setlocal tabstop=4 |
    \ setlocal softtabstop=4 |
    \ setlocal shiftwidth=4 |
    \ setlocal autoindent

" Flag bad whitespace (extra at end of line)
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+\%#\@<!$/
" Make highlight show up as insert mode is left.
au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
au InsertLeave * match ExtraWhitespace /\s\+$/

" Easier split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Update .vimrc quickly
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" Easier normal mode
inoremap jk <esc>

" Natural splits
set splitbelow
set splitright

" Jump to last position when reopen
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Only run certain linters
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'python': ['flake8'],
\}
let g:ale_linters_explicit = 1
" Only want linters to run on save.
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
" don't want linters to run on opening a file
let g:ale_lint_on_enter = 0

" Run certain fixers
let g:ale_fixers = {
\   'javascript': ['prettier'],
\   'css': ['prettier'],
\}
let g:ale_fix_on_save = 1
let g:ale_fix_on_enter = 0

" netrw settings:
let g:netrw_liststyle = 3
" Remove directory banner
let g:netrw_banner = 0

" Look for tags recursively in directory of current file and above parent directories.
set tags=./tags;

execute pathogen#infect()
