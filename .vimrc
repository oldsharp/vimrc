" Use :source $MYVIMRC to reload .vimrc file.

set nocompatible

set helplang=cn

set number
set showcmd     " Show (partial) command in status line.
set showmatch   " Show matching brackets.
set ignorecase  " Do case insensitive matching
set smartcase   " Do smart case matching
set incsearch   " Incremental search
set autowrite   " Automatically save before commands like :next and :make
set hidden      " Hide buffers when they are abandoned
set ruler       " show the cursor position all the time
if has('mouse')
    set mouse=a " Enable mouse usage (all modes)
endif

set backspace=indent,eol,start
set history=50

colorscheme wombat256mod

set nobackup
set nowritebackup
set noswapfile

" Use :retab to replace tabs to spaces.
set smarttab
set tabstop=4
set softtabstop=4
set expandtab
set shiftwidth=4

set t_Co=256
" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

let python_highlight_all = 1
let python_version_2 = 1
syntax enable
filetype on
set wrap

autocmd FileType python set cc=80
set foldmethod=manual

set encoding=UTF-8
set fileencodings=ucs-bom,UTF-8,cp936,GBK,GB18030,BIG5,euc-jp,euc-kr,latin1
set fileformats=unix,dos,mac

"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%04l,\ %04v][%03p%%]\ [LEN=%L]
set laststatus=2
set noshowmode

set cursorline
au InsertEnter * set nocursorline
au InsertLeave * set cursorline
set cursorcolumn
au InsertEnter * set nocursorcolumn
au InsertLeave * set cursorcolumn

if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  "autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent        " always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
          \ | wincmd p | diffthis
endif

nnoremap <silent> <F6> :IndentGuidesToggle<CR>
nnoremap <silent> <F8> :NERDTreeToggle<CR>
nnoremap <silent> <F9> :TagbarToggle<CR>

" indent-guides setting GUI custom indent colors
let g:indent_guides_auto_colors = 1
"autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=4
"autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=5

" pathogen enabled.
execute pathogen#infect()

let g:Powerline_symbols = 'fancy'

"mode                name    default       note ~
"Normal              n       ' N '         (surrounded by spaces)
"Insert              i       INSERT
"Replace             R       REPLACE       |Replace-mode|
"Visual              v       VISUAL        |Visual-mode|
"Visual linewise     V       V⋅LINE
"Visual blockwise    cv      V⋅BLOCK
"Select              s       SELECT        |Select-mode|
"Select linewise     S       S⋅LINE
"Select blockwise    cs      S⋅BLOCK
let g:Powerline_mode_n = 'NORMAL'
let g:Powerline_mode_V = 'V-LINE'
let g:Powerline_mode_cv = 'V-BLOCK'
let g:Powerline_mode_S = 'S-LINE'
let g:Powerline_mode_cs = 'S-BLOCK'

"let g:Powerline_theme = 'solarized256'
"let g:Powerline_colorscheme = 'solarized256'
let g:Powerline_stl_path_style = 'full' "filename, short, relative, full
let g:Powerline_cache_enabled = 1

" set gui font
"if has('gui_running')
"    set guifont=Ubuntu\ Mono\ for\ Powerline\ 13
"endif

" escape the insert mode immediately
if ! has('gui_running')
    set ttimeoutlen=10
    augroup FastEscape
        autocmd!
        au InsertEnter * set timeoutlen=0
        au InsertLeave * set timeoutlen=1000
    augroup END
endif

" -------------- vim-flake8 settings ---------------------------------------
"autocmd FileType python map <buffer> <F6> :call Flake8()<CR>
"let g:flake8_ignore="E501,W293"
"let g:flake8_max_line_length=99
"autocmd BufWritePost *.py call Flake8()
" -------------- vim-flake8 settings end ----------------------------------

set listchars=tab:>-,trail:.,nbsp:%,extends:>,precedes:<
set list

":cscope add ./cscope.out
