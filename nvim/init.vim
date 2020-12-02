let maplocalleader=" " "change local leader to space.

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
Plug 'ayu-theme/ayu-vim' "theme
Plug 'dense-analysis/ale' "linting
Plug 'habamax/vim-sendtoterm' "send to terminal
"Plug 'vim-pandoc/vim-rmarkdown' "rmd code highlighting
Plug 'vim-pandoc/vim-pandoc-syntax' "rmd code highlighting
Plug 'vim-pandoc/vim-pandoc' "rmd code highlighting 
Plug 'tpope/vim-surround' "surround in quotes
Plug 'tpope/vim-repeat' "add repeatability to vim surround
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
call plug#end()


""" Terminal Looks
	"ayu theme settings
	set termguicolors     " enable true colors support
	let ayucolor="dark" " for mirage version of theme
	colorscheme ayu

	set number relativenumber "enable relative number lines
	set modifiable "allow buffer to be modifiable

	"escape from terminal to normal mode
	if has('nvim')
		  :tnoremap <C-w> <C-\><C-n><C-w>
	  endif

	"highlight search when using * to find next occurance 
	"turn hightlighting off after search
	":noh
	set hlsearch
	"folding
	let r_syntax_folding=1
	set nofoldenable
	set foldmethod=indent
	" set foldmethod=marker
	" set foldmarker=```,```
	set tabstop=4 "how many spaces should vim take <tab> to be
	set shiftwidth=4 "indent width
	set softtabstop=4 "number of columns per tab?
	set expandtab "make tabs, spaces

    "Status Line
    set statusline=
    set statusline+=%7*\[%n]                                  "buffernr
    set statusline+=%1*\ %<%F\                                "File+path
    set statusline+=%2*\ %y\                                  "FileType
    " set statusline+=%3*\ %{''.(&fenc!=''?&fenc:&enc).''}      "Encoding
    " set statusline+=%3*\ %{(&bomb?\",BOM\":\"\")}\            "Encoding2
    " set statusline+=%4*\ %{&ff}\                              "FileFormat (dos/unix..) 
    " set statusline+=%5*\ %{&spelllang}\%{HighlightSearch()}\  "Spellanguage & Highlight on?
    set statusline+=%8*\ %=\ row:%l/%L\ (%3p%%)\             "Rownumber/total (%)
    set statusline+=%9*\ col:%3c\                            "Colnr
    set statusline+=%0*\ \ %m%r%w\ %P\ \                      "Modified? Readonly? Top/bot.
"""

""" vimtex options
	filetype plugin on "turn on filetype plugin for files in .vim/ftplugin/*
	syntax on "code highlighting
	let g:tex_flavor='latex'
    let g:vimtex_view_method='zathura'
	let g:vimtex_fold_enabled=1
	let g:vimtex_fold_types = {
				\ 'envs' : {'whitelist' : ['algorithm'], 'blacklist' : ['figure','align']},
				\ 'comments' : {'enable' : 1}, 
				\ 'sections' : {'sections' : ['section','subsection','subsubsection']}
				\}
	"setlocal spell
	let g:tex_flavor = 'latex'
	"linting 
	"execute 'packadd ale'
	"let b:ale_fixers = ['remove_trailing_lines',  'trim_whitespace']
	"let b:ale_linters = ['chktex']
"""

"keep pandoc from hiding my shit. 
let g:pandoc#syntax#conceal#use = 0
let g:pandoc#modules#disabled = ["spell"]
let R_openpdf = 0
let g:pandoc#modules#enabled = ["folding"]  

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
"let Rout_more_colors = 1 "more output color


