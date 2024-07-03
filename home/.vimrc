set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,sjis,iso-2022-jp,euc-jp 
scriptencoding utf-8

set fileformats=unix,dos

if &compatible
    set nocompatible
endif

if exists('+termguicolors')
    set termguicolors
endif

set ambiwidth=single

set autoread
set clipboard^=unnamedplus

set number
set cursorline

set hlsearch
set incsearch
set ignorecase
set smartcase
set wrapscan
set whichwrap=b,s,h,l,<,>,[,],~

set smartindent
set autoindent
set expandtab
set tabstop=4
set shiftwidth=4

set laststatus=2
set wildmenu
set hidden

set updatetime=300
set noshowmode
set shortmess+=c

filetype plugin indent on
syntax on

let mapleader=' '
nnoremap j gj
nnoremap k gk
nnoremap <down> gj
nnoremap <up> gk

