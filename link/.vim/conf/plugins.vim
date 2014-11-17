set nocompatible " be iMproved, required
filetype off     " required

" set the runtime path to include Vundle and initialize
if has("win32")
   set rtp+=~/vimfiles/bundle/Vundle.vim/
   let path='~/vimfiles/bundle'
   call vundle#begin(path)
elseif has("unix")
   set rtp+=~/.vim/bundle/Vundle.vim
   call vundle#begin()
endif
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" PLUGINS
"Plugin 'terryma/vim-multiple-cursors'   " Just like sublime text!
"Plugin 'edsono/vim-matchit'             " Better matching with %
"Plugin 'ervandew/supertab'              " Tab completion is better than C-N
Plugin 'raimondi/delimitMate'            " Auto-match parens, etc.
Plugin 'airblade/vim-gitgutter'          " Git diffing info in the gutter
Plugin 'bling/vim-airline'               " Better status line
Plugin 'ctrlpvim/ctrlp.vim'              " File, buffer, mru finder
Plugin 'davidoc/taskpaper.vim'           " Just like in Taskpaper.
Plugin 'junegunn/vim-easy-align'         " Align text... easily.
Plugin 'kshenoy/vim-signature'           " Marks in the gutter
Plugin 'lokaltog/vim-easymotion'         " Super fast navigation!
Plugin 'majutsushi/tagbar'               " Show ctags
Plugin 'mhinz/vim-startify'              " Start menu!
Plugin 'plasticboy/vim-markdown'         " Markdown highlighting
Plugin 'rhysd/clever-f.vim'              " Use f to repeat f instead of ;
Plugin 'scrooloose/nerdcommenter'        " Easy comments
Plugin 'scrooloose/nerdtree'             " File navigation
Plugin 'tpope/vim-fugitive'              " Git wrapper for VIM
Plugin 'tpope/vim-repeat'                " Dot works for plugins
Plugin 'tpope/vim-surround'              " Manipulate parens, quotes, etc.
Plugin 'wellle/targets.vim'              " More & smarter text objects
Plugin 'xolox/vim-misc'                  " Required for vim-shell (GVIM Windows)
Plugin 'xolox/vim-shell'                 " Actually fullscreen (GVIM Windows)
Plugin 'nathanaelkane/vim-indent-guides' " Show indents visually
Plugin 'godlygeek/csapprox'              " Approximate GUI colors for terminal
Plugin 'Shougo/neomru.vim'
Plugin 'Shougo/unite.vim'
Plugin 'Shougo/vimproc.vim'
"Plugin 'myusuf3/numbers.vim'
Plugin 'tpope/vim-abolish'               " Handle multiple variants of a word.

" Not working
" Plugin 'Valloric/YouCompleteMe'          " Completion engine

" SNIPPETS
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
"Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'              " Precompiled snippets

" COLORSCHEMES
Plugin 'tomasr/molokai'
Plugin 'pychimp/vim-luna'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" VUNDLE MANDATORY OPTIONS OVER; PLUGIN SETTINGS TO FOLLOW

" COLORS
colorscheme luna

" AIRLINE
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts            = 1 " Also fix the fonts
let g:airline_detect_whitespace          = 0 " Hide the trailing whitespace warning
set laststatus=2 " Always show the airline statusbar
set noshowmode   " Don't show the -- MODE -- indicator below airline
set encoding=utf-8

" EASYMOTION
let g:EasyMotion_smartcase        = 1 " Turn on case sensitive feature
let g:EasyMotion_enter_jump_first = 1 " Enter jumps to first match; works poorly

" STARTIFY
let g:startify_custom_header = [ 'VI VI VI THE EDITOR OF THE BEAST', '' ]

" EASY ALIGN
" Custom easy-easy-alignment delimiters:
"     " -- setting comments in VIMRC; ignores section-starting comments
let g:easy_align_delimiters = {
         \ '"': {
         \ 'pattern'       : '"',
         \ 'ignore_groups' : ['String'],
         \ 'filter'        : 'v/^\s*"[^"]*$'
         \ }
\ }

" SHELL
let g:shell_fullscreen_items = 'mT' " Leave the tabline alone!

" INDENT GUIDES
let g:indent_guides_auto_colors           = 0
let g:indent_guides_start_level           = 1
let g:indent_guides_enable_on_vim_startup = 1
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=gray14
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=gray13

" DELIMITMATE
let g:delimitMate_expand_space         = 1
let g:delimitMate_expand_inside_quotes = 1
let g:delimitMate_expand_cr            = 1
let g:delimitMate_jump_expansion       = 1
autocmd FileType vim let b:delimitMate_quotes = "' ` *"

" UNITE
call unite#filters#matcher_default#use(['matcher_fuzzy'])
let g:unite_source_history_yank_enable = 1
