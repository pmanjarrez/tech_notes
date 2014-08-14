if v:lang =~ "utf8$" || v:lang =~ "UTF-8$"
    set fileencodings=utf-8,latin1
endif

set nocompatible " Use Vim defaults (much better!)
set bs=indent,eol,start      " allow backspacing over everything in insert mode
"set ai          " always set autoindenting on
"set backup      " keep a backup file
set viminfo='20,\"50 " read/write a .viminfo file, don't store more
" than 50 lines of registers
set history=50      " keep 50 lines of command line history
set ruler       " show the cursor position all the time

" Only do this part when compiled with support for autocommands
if has("autocmd")
    augroup redhat
    " In text files, always limit the width of text to 78 characters
    autocmd BufRead *.txt set tw=78
    " When editing a file, always jump to the last cursor position
    autocmd BufReadPost *
        \ if line("'\"") > 0 && line ("'\"") <= line("$") |
        \   exe "normal! g'\"" |
        \ endif
    augroup END
endif

if has("cscope") && filereadable("/usr/bin/cscope")
    set csprg=/usr/bin/cscope
    set csto=0
    set cst
    set nocsverb
    " add any database in current directory
    if filereadable("cscope.out")
        cs add cscope.out
        " else add database pointed to by environment
    elseif $CSCOPE_DB != ""
        cs add $CSCOPE_DB
    endif
    set csverb
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
    syntax on
    set hlsearch
endif

if &term=="xterm"
    set t_Co=8
    set t_Sb=^[[4%dm
    set t_Sf=^[[3%dm
endif

" Set map leader to space
let mapleader=" "
    
" Tabs and indentation
set autoindent
filetype indent on
set smartindent
set smarttab
set tabstop=4
set softtabstop=4
" Use spaces for tabs
set expandtab
set shiftwidth=4
set shiftround

" Enable mouse support
set mouse=a

" Enable syntax highlight
if has("syntax")
    syntax on
endif

" Show line numbers
set nu

" Mapping to navigate through tabs
nnoremap <leader>th  :tabfirst<CR>
nnoremap <leader>tj  :tabnext<CR>
nnoremap <leader>tk  :tabprev<CR>
nnoremap <leader>tl  :tablast<CR>
nnoremap <leader>tt  :tabedit<Space>
nnoremap <leader>tn  :tabnext<Space>
nnoremap <leader>tm  :tabm<Space>
nnoremap <leader>td  :tabclose<CR>

" Mapping execution commands
nnoremap <leader>r :!%:p
nnoremap <leader>R :!%:p<CR>
