" Basic setup {{{1
set nocompatible
syntax enable
filetype plugin indent on
" }}}1

" vim-plug {{{1
" boostrap {{{2
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
" }}}2

" vim-plug plugins {{{2
call plug#begin('~/.vim/plugged')
Plug 'chrisbra/csv.vim'
Plug 'chrisbra/vim-diff-enhanced'
Plug 'derekwyatt/vim-fswitch'
Plug 'flazz/vim-colorschemes'
Plug 'kshenoy/vim-signature'
Plug 'majutsushi/tagbar'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'tpope/vim-vinegar'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()
" Run :PlugInstall to install the plugins
" }}}2

" }}}1

" Editor display config {{{1
set number
set ruler
set laststatus=2
set nowrap
" }}}1

" Color and highlighting settings {{{1
set background=dark
set hlsearch
colorscheme solarized

" make trailing whitespace ugly
highlight ExtraWhiteSpace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

highlight SignColumn ctermbg=0
" }}}1

" Keyboard and indent behaviour {{{1
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set smarttab

set backspace=indent,eol,start
set autoindent
set smartindent

" do not indent namespace content and scope declaration sin C++ files
set cino=N-s,g0
" }}}1

" Search behaviour {{{1
set hlsearch
set incsearch
set ignorecase
set smartcase
" }}}1

" Key bindings {{{1
nmap <C-w>s :split<CR>	" Split window horizontally
nmap <C-w>v :vsplit<CR> " Split window vertically

nnoremap <silent> <C-l> :nohlsearch<CR>
nnoremap <silent> <F3> :set list!<CR>
" remove all trailing whitespace
nnoremap <silent> <F5> :let _s=@/ <Bar> :%s/\s\+$//g <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>
" cat the selection for easy copy from terminal
xnoremap <leader>c <esc>:'<,'>:w !cat<CR>

" don't have to reach out for that far away esc key, irrelevant on UHK
inoremap jk <esc>
inoremap jj <esc>

" Get rid of bad habits {{{2
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
" }}}2
" }}}1

" Folding and wrapping settings {{{1
set foldlevel=99
set foldmethod=syntax
" }}}1

" Undo file settings {{{1
set undofile
set undodir=${HOME}/.vim/undofile
set undolevels=100
set undoreload=1000
" }}}1

" Plugin config {{{1

" csv.vim {{{2
let g:csv_nl = 1
autocmd BufWritePre *.csv :%UnarrangeColumn " write the most compact CSV to file
" }}}2
"
" vim-airline {{{2
let g:airline#extensions#csv#column_display = 'Name'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline_powerline_fonts = 1
" }}}2

" vim-diff-enhanced {{{2
if &diff
    syntax off
    let &diffexpr='EnhancedDiff#Diff("git diff", "--diff-algorithm=patience -w")'
endif
" }}}2

" vim-indent-guides {{{1
let g:indent_guides_auto_colors=0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd guibg=black ctermbg=238
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=gray ctermbg=240
" }}}2

" tagbar {{{2
nnoremap <silent> <F2> :TagbarToggle<CR>
let g:tagbar_autofocus = 1
" }}}2

" fswitch {{{2
nnoremap <silent> <F4> :FSHere<CR>
" }}}2

" }}}1

" vim: foldmethod=marker foldlevel=99
