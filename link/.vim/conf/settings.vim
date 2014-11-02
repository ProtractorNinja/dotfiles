" RESET TO VIM-DEFAULTS
if &compatible              " only if not set before:
    set nocompatible        " use vim-defaults instead of vi-defaults (easier, more user friendly)
endif

" DISPLAY SETTINGS
"set showmode               " show mode in status bar (insert/replace/...)
"set laststatus=2           " use 2 lines for the status bar
set background=dark         " enable for dark terminals
set nowrap                  " dont wrap lines
set scrolloff=2             " 2 lines above/below cursor when scrolling
set number                  " show line numbers
set showmatch               " show matching bracket (briefly jump)
set showcmd                 " show typed command in status bar
set ruler                   " show cursor position in status bar
set title                   " show file in titlebar
set wildmenu                " completion with menu
set wildignore=*.o,*.obj,*.bak,*.exe,*.py[co],*.swp,*~,*.pyc,.svn
set matchtime=2             " show matching bracket for 0.2 seconds
set matchpairs+=<:>         " specially for html
set linebreak
set showbreak=+++
set formatoptions=1
set breakat=80
"set wrap                   " Wrap lines past the edge of the window
set encoding=utf-8          " Fix the fonts
set listchars=tab:»·,trail:·,nbsp:·,
set list                    " Display specified whitespace listchars
set go-=m go-=T go-=r go-=L " Remove most of GVim's extras (text only, please!)

" EDITOR SETTINGS
set esckeys                 " map missed escape sequences (enables keypad keys)
set ignorecase              " case insensitive searching
set smartcase               " but become case sensitive if you type uppercase characters
set smartindent             " smart auto indenting
set smarttab                " smart tab handling for indenting
set magic                   " change the way backslashes are used in search patterns
set bs=indent,eol,start     " allow backspacing over everything in insert mode
set tabstop=3               " number of spaces a tab counts for
set shiftwidth=3            " spaces for autoindents
set expandtab               " turn a tabs into spaces
"set fileformat=unix        " file mode is unix
"set fileformats=unix,dos   " only detect unix file format, displays that ^M with dos files
set si                      " Smart indent
set ai                      " Auto-indent

" SYSTEM SETTINGS
set lazyredraw              " no redraws in macros
set confirm                 " get a dialog when :q, :w, or :wq fails
"set nobackup                " no backup~ files.
set viminfo='20,\"500       " remember copy registers after quitting in the .viminfo file -- 20 jump links, regs up to 500 lines'
set undolevels=1000         " UNDO FOR DAYS
set hidden                  " remember undo after quitting
set history=1000            " keep 50 lines of command history
set mouse=v                 " use mouse in visual mode (not normal,insert,command,help mode)

" COLOR SETTINGS (IF TERMINAL/GUI SUPPORTS IT)
if &t_Co > 2 || has("gui_running")
   syntax on                " enable colors
   set hlsearch             " highlight search (very useful!)
   set incsearch            " search incremently (search while typing)
   set colorcolumn=80
   highlight! colorcolumn guibg=Gray15

   " Target the cursor nicely
   set cursorcolumn         " Target practice
   set cursorline           " Also Target practice
   highlight! cursorColumn gui=NONE guibg=Gray16 guifg=Gray65
   highlight! cursorLine gui=NONE guibg=Gray16

   " Highlight listchars whitespace & extras quietly
   highlight! link SpecialKey Comment
   highlight! link NonText Comment

endif

" ONT SETTINGS
if has('gui_running')
    if has('unix')
       set guifont=Fantasque\ Sans\ Mono\ 18
    elseif
       set guifont=Fantasque_Sans_Mono:h13
    endif
endif

" PASTE MODE TOGGLE (NEEDED WHEN USING AUTOINDENT/SMARTINDENT)
map <F9> :set paste<CR>
map <F10> :set nopaste<CR>
imap <F9> <C-O>:set paste<CR>
imap <F10> <nop>
set pastetoggle=<F10>

" Use of the filetype plugins, auto completion and indentation support
filetype plugin indent on

" FILE TYPE SPECIFIC SETTINGS
" I don't even know how these work! I'm leaving them here just in case, though...
if has("autocmd")
    " For debugging
    "set verbose=9

    " if bash is sh.
    let bash_is_sh=1

    " change to directory of current file automatically
    autocmd BufEnter * lcd %:p:h

    " Put these in an autocmd group, so that we can delete them easily.
    augroup mysettings
        au FileType xslt,xml,css,html,xhtml,javascript,sh,config,c,cpp,docbook set smartindent shiftwidth=2 softtabstop=2 expandtab
        au FileType tex set wrap shiftwidth=2 softtabstop=2 expandtab
        au Filetype vim let b:delimitmate_quotes = "' ` *"

        " Confirm to PEP8
        au FileType python set tabstop=4 softtabstop=4 expandtab shiftwidth=4 cinwords=if,elif,else,for,while,try,except,finally,def,class
    augroup END

    " Always jump to the last known cursor position.
    " Don't do it when the position is invalid or when inside
    " an event handler (happens when dropping a file on gvim).
    autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

endif " has("autocmd")
