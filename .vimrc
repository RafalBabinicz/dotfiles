set nocompatible		" be vimproved
"default content above
"
"
"lang en
language mes en
set langmenu=en_US.UTF-8

" Backup files
set backupdir=~\.vim\tmp
"___Vundler
filetype off			" required!
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" My Bundles here:
"
" original repos on github
"Bundle 'tpope/vim-fugitive'
Bundle 'mattn/zencoding-vim'
Bundle 'altercation/vim-colors-solarized'
Bundle 'tpope/vim-vividchalk'
Bundle 'tpope/vim-fugitive'
Bundle 'vim-scripts/VimClojure'
Bundle 'tpope/vim-rails'
" vim-scripts repos
"Bundle 'L9'
" non github repos
"Bundle 'git://git.wincent.com/command-t.git'
 " ...

filetype plugin indent on	" required! Turn on file type detection

"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..

" gui option

set antialias                     " MacVim: smooth fonts.
set encoding=utf-8                " Use UTF-8 everywhere.
set guioptions-=T                 " Hide toolbar.
"set background=light              " Background.
set lines=25 columns=100          " Window dimensions.
set guioptions-=r                 " Don't show right scrollbar


"basics
syntax enable			" Turn on syntax highlighting
set number				" Show line numbers
set ruler				" Show cursor position

set tabstop=3
set shiftwidth=3
set guifont=Consolas:h8:cEASTEUROPE
set smartindent
set autoindent

set wrap					" Turn on line wrapping
set scrolloff=3		" Show 3 lines around the cursor

set title				" Set terminal's title

set visualbell			" No bleeps

set nobackup			" No bakcup before overwriting a file
set nowritebackup		" 
set directory=.,$TEMP	" Swap files in one loc


"to check
"set showcmd			" Display incomplete commands
"set showmode			" Display the mode you're in
set hidden				" Handle multiple buffers better.
set backspace=indent,eol,start	" Intuitive backspacing.
set laststatus=2		" Show the status line all the time
"set linespace=3
"set splitbelow "Split window below current window
"set hlsearch			Highlight matches
"set incsearch			Highlight matches as you type


" Useful status information at bottom of screen
set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ %{fugitive#statusline()}%{exists('*CapsLockStatusline')?CapsLockStatusline():''}%=%-16(\ %l,%c-%v\ %)%P
"

" UNCOMMENT TO USE
"set tabstop=2                    " Global tab width.
"set shiftwidth=2                 " And again, related.
"set expandtab                    " Use spaces instead of tabs


set ignorecase			" Case-insensitive searching
set smartcase			" Case-sensitive if expression contains a capital letters
"set go-=T
" 

"set dictionary+=/Users/Home/.vim/dict.txt

" Solarized theme
set background=dark
colorscheme solarized


"Autocompletion
set wildmenu 						" Enhanced command line completion:
set wildmode=list:longest		" Complete files like a shell

set foldenable
set foldmethod=syntax

" MAPPINGS
nmap <space> :
imap ,e <esc>

" Map code completion to ,TAB
imap ,<tab> <C-x><C-o>

" Tabs
map <leader>tt :tabnew<cr>
map <leader>te :tabedit
map <leader>tc :tabclose<cr>
map <leader>to :tabonly<cr>
map <leader>tn :tabnext<cr>
map <leader>tp :tabprevious<cr>
map <leader>tf :tabfirst<cr>
map <leader>tl :tablast<cr>
map <leader>tm :tabmove


"to check
"nmap ,server :Nread ftp://myadres<cr>
"imap ,<tab><tab> <c-x><c-k>

" vimrc editing
nmap ,ev :tabedit $MYVIMRC<cr>


" Source vimrc after saving it
if has("autocmd")
	autocmd! bufwritepost _vimrc source %
endif

" Load buffer in
" Opera
abbrev opera :! "d:\_appz\o\opera.exe" %:p<cr>

"Auto-lly change current dir to current file buffer dir
"autocmd BufEnter * cd %:p:h
"set autochdir
"pluginn vim-rooter, search .git

" FOLDING
" Automatic fold settings for specific files. Uncomment to use.
" autocmd FileType ruby setlocal foldmethod=syntax
" autocmd FileType css  setlocal foldmethod=indent shiftwidth=2 tabstop=2


" PLUGINS
" ZEN CODING
let g:user_zen_expandabbr_key = '<C-e>'

"default content below
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set diffexpr=MyDiff()
function! MyDiff()		"added ! mark to overwrite existing function
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction
