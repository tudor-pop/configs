"https://github.com/junegunn/vim-plug
" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
" Make sure you use single quotes
call plug#begin('~/.vim/plugged')

Plug 'https://github.com/joshdick/onedark.vim'
Plug 'https://github.com/sheerun/vim-polyglot'
Plug 'itchyny/lightline.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'scrooloose/nerdcommenter'

call plug#end()



set number
set hlsearch
set relativenumber
set noshowmode
syntax on
filetype on
colorscheme onedark
filetype plugin indent on
inoremap jk <esc>
inoremap kj <esc>
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" on pressing tab, insert 4 spaces
" set expandtab
