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
Plug 'ncm2/ncm2' "neovim layer for vim
Plug 'roxma/nvim-yarp' "completion manager
Plug 'gaalcaras/ncm-R' "code completion
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'lervag/vimtex' "for tex
Plug 'tomasr/molokai' "theme
Plug 'dense-analysis/ale' "linting
Plug 'habamax/vim-sendtoterm' "send to terminal
"Plug 'vim-pandoc/vim-rmarkdown' "rmd code highlighting
Plug 'vim-pandoc/vim-pandoc-syntax' "rmd code highlighting
Plug 'vim-pandoc/vim-pandoc' "rmd code highlighting 
Plug 'tpope/vim-surround' "surround in quotes
call plug#end()

set number relativenumber "enable relative number lines
set modifiable "allow buffer to be modifiable

filetype plugin on "turn on filetype plugin for files in .vim/ftplugin/*
syntax on "code highlighting
let g:tex_flavor='latex'

" enable ncm2 for all buffers
 autocmd BufEnter * call ncm2#enable_for_buffer()
" IMPORTANT: :help Ncm2PopupOpen for more information
set completeopt=noinsert,menuone,noselect
" NOTE: you need to install completion sources to get completions. Check our wiki page for a list of sources:
" https://github.com/ncm2/ncm2/wiki
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
"autocmd BufWritePost *.tex silent! execute "!pdflatex % >/dev/null 2>&1" | redraw!

"keep pandoc from hiding my shit. 
let g:pandoc#syntax#conceal#use = 0
let g:pandoc#modules#disabled = ["spell"]
let R_openpdf = 0
