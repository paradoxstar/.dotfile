" vim: fdm=marker ts=2 sts=2 sw=2 fdl=0
"
" This file doesn't contain any plugin
" options only!

if &compatible
  set nocompatible               " Be iMproved
endif

syntax on
filetype plugin indent on
set mouse=r                                         "enable mouse
set ttyfast                                         "assume fast terminal connection
set lazyredraw
set viewoptions=folds,options,cursor,unix,slash     "unix/windows compatibility
set encoding=utf-8                                  "set encoding for text
set fileencodings=utf-8,gbk                         "file encoding
set clipboard=unnamed
set showcmd
set completeopt-=preview
set backspace=indent,eol,start                      "allow backspacing everything in insert mode
set autoindent                                      "automatically indent to match adjacent lines
set expandtab                                       "spaces instead of tabs
set smarttab                                        "use shiftwidth to enter tabs
set tabstop=2                                       "number of spaces per tab for display
set softtabstop=2                                   "number of spaces per tab in insert mode
set shiftwidth=2                                    "number of spaces when indenting
set shiftround                                      "round indent to multiple of 'shiftwidth'
set linebreak                                       "wrap long lines
set display+=lastline                               "as much as possible of the last line will be displayed
set wildmenu                                        "show list for autocomplete
set wildmode=list:longest                           "when more than one match, list all matches and complete first match
set textwidth=0                                     "set text width
set hlsearch                                        "highlight searches
set incsearch                                       "incremental searching
set ignorecase                                      "ignore case for searching
set smartcase                                       "do case-sensitive if there's a capital letter
set noswapfile                                      "diable swap files
set noerrorbells                                    "disable bell
set visualbell                                      "enable visual bell and set t_vb to nothing
set t_vb=                                           "disable bell

" ui options
set background=dark
set showmatch                                       "automatically highlight matching braces/brackets/etc.
set matchtime=2                                     "tens of a second to show matching parentheses
set number                                          "precede each line with its line number
set laststatus=2                                    "always shows the status line
set noshowmode
set foldenable                                      "enable folds by default
set foldlevelstart=99                               "open all folds by default

autocmd FileType markdown setlocal nolist
autocmd FileType vim setlocal fdm=indent keywordprg=:help
autocmd FileType python set shiftwidth=2 softtabstop=2 tabstop=2 expandtab
autocmd FilterWritePre * if &diff | setlocal wrap< | endif

" file types
autocmd BufRead,BufNewFile SConstruct   set filetype=python
autocmd BufRead,BufNewFile SConscript   set filetype=python
autocmd BufRead,BufNewFile *.cu,*.cuda  set filetype=cpp
autocmd BufRead,BufNewFile *.maxj       set filetype=java
autocmd BufRead,BufNewFile gitconfig    set filetype=gitconfig
