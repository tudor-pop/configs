"https://github.com/junegunn/vim-plug
" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
" Make sure you use single quotes
call plug#begin('~/.vim/plugged')

Plug 'https://github.com/joshdick/onedark.vim'
Plug 'https://github.com/sheerun/vim-polyglot'

call plug#end()


set number
syntax on
filetype on
colorscheme onedark
