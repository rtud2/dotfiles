" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'jalvesaq/Nvim-R', {'branch': 'stable'} "R ide
Plug 'gaalcaras/ncm-R' "code completion
Plug 'tomasr/molokai'
Plug 'dense-analysis/ale'
call plug#end()

set number relativenumber "enable relative number lines
