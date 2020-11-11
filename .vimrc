" Specify a directory for plugins
" to source, so ~/.vimrc
" to install, PlugInstall
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
Plug 'lervag/vimtex' "for tex
Plug 'tomasr/molokai' "theme
Plug 'dense-analysis/ale' "linting
Plug 'habamax/vim-sendtoterm' "send to terminal
"Plug 'vim-pandoc/vim-rmarkdown' "rmd code highlighting
Plug 'vim-pandoc/vim-pandoc-syntax' "rmd code highlighting
Plug 'vim-pandoc/vim-pandoc' "rmd code highlighting 
Plug 'tpope/vim-surround' "surround in quotes
Plug 'tpope/vim-repeat' "add repeatability to vim surround
Plug 'SirVer/ultisnips'
Plug 'ncm2/ncm2-ultisnips'
" NOTE: you need to install completion sources to get completions. Check our wiki page for a list of sources:
" https://github.com/ncm2/ncm2/wiki
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
call plug#end()

set number
"set number relativenumber "enable relative number lines
set modifiable "allow buffer to be modifiable

"turn hightlighting off after search
":noh

filetype plugin on "turn on filetype plugin for files in .vim/ftplugin/*
syntax on "code highlighting
let g:tex_flavor='latex'


"keep pandoc from hiding my shit. 
let g:pandoc#syntax#conceal#use = 0
let g:pandoc#modules#disabled = ["spell"]
let R_openpdf = 0

" enable ncm2 for all buffers
 autocmd BufEnter * call ncm2#enable_for_buffer()
" IMPORTANT: :help Ncm2PopupOpen for more information
set completeopt=noinsert,menuone,noselect
"autocmd BufWritePost *.tex silent! execute "!pdflatex % >/dev/null 2>&1" | redraw!
"
" ncm-option 
" suppress the annoying 'match x of y', 'The only match' and 'Pattern not found' messages
set shortmess+=c

" When the <Enter> key is pressed while the popup menu is visible, it only
" hides the menu. Use this mapping to close the menu and also start a new    
" line.
inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")
" Use <TAB> to select the popup menu:
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"    
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

"NvimR options
let R_rconsole_width = winwidth(0)/3 "divide sceen by three
let Rout_more_colors = 1 "more output color


