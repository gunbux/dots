" Chun's Personal Vim/nVim config

"vim-plug plugins
call plug#begin('~/.config/nvim/plugged')

Plug 'liuchengxu/eleline.vim'
Plug 'junegunn/goyo.vim'
Plug 'mattn/emmet-vim'
Plug 'preservim/nerdtree'
Plug 'easymotion/vim-easymotion'
Plug 'Vimjas/vim-python-pep8-indent'

caeasymotion/vim-easymotionll plug#end()

" Basic Settings

" Turns on mouse
set mouse=a

" Turns on basic funcitonality
set history=500
syntax on
set ignorecase
set smartcase
set encoding=utf-8
set number relativenumber
set termguicolors
set hlsearch

" General Settings

"Setting the leader key, I like it to be space
let mapleader = " "

" Use system clipboard - Only use if you have a clipboard manager
" set clipboard+=unamedplus

" Centers screen when entering insert mode
autocmd InsertEnter * norm zz

" Removes any trailing whitespaces
autocmd BufWritePre * %s/\s\+$//e

" System commands

" Basic system calls
nnoremap <C-t> :!touch<Space>
nnoremap <C-e> :!crf<Space>
nnoremap <C-f> :!mkdir<Space>
nnoremap <C-m> :!mv<Space>%<Space>

" Toggles for auto-commenting
map <leader>c :setlocal formatoptions-=cro<CR>
map <leader>C :setlocal formatoptions=cro<CR>

" Toggles for auto-indenting
map <leader>i :setlocal autoindent<CR>
map <leader>I :setlocal noautoindent<CR>

" Toggles for highlighting
map <leader>o :setlocal hlsearch<CR>
map <leader>O :setlocal nohlsearch<CR>
" Turn backup off, since most stuff is in git anyway
set nobackup
set nowb
set noswapfile

" Turn persistent undo on
try
  set undodir=~/.vim_runtime/temp_dirs/undodir
  set undofile
catch
endtry

" Tab settings
set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2

set wildmode=longest,list,full

" Better tabbing
vnoremap < <gv
vnoremap > >gv

" Cursor settings - remove if experiencing lag on low end machines
" set cursorline
" set cursorcolumn
" highlight CursorLine ctermbg=Yellow vterm=bold guibg=#2b2b2b
" highlight CursorColumn cterm=Yellow cterm=bold guibg=#2b2b2b


" Splits, buffers, search options

" Close current buffer
map <leader>bd :Bclose<cr>:tabclose<cr>gT

" Close all the buffers
map <leader>ba :bufdo bd<cr>

" Fix default splitting
set splitbelow splitright

" Basic split movement
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Resizing splits
nnoremap <M-j> :resize -2<CR>
nnoremap <M-j> :resize +2<CR>
nnoremap <M-j> :vertical resize -2<CR>
nnoremap <M-j> :vertical resize +2<CR>

" Using splits
nnoremap <leader>h :split<Space><CR>
nnoremap <leader>v :vsplit<Space><CR>

" Special Keybindings/Keymapping

" Remap 0 to first non-blank character
map 0 ^
" Capital S for replacing text
nnoremap S :%S//gI<Left><Left><Left>

" Save and quit aliases
nnoremap <leader>q :wq<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>e :q!<CR>

" Shotcut for escape
inoremap jk <Esc>
inoremap kj <Esc>

" Easy caps
inoremap <c-c> <Esc>viwUi
nnoremap <c-c> viwU<Esc>

" Goyo hotkeys
nnoremap <leader>g :Goyo<CR>
nnoremap <leader>G :Goyo!<CR>
" Ignore permission denied errors - to change this to amix's config
cnoremap w!! execute'slient! write !sudo tee % >/dev/null' <bar> edit!

" Nerdtree configuration
map <C-f> :NERDTreeToggle<Cr>

" Open up NerdTree even when no file was specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Something something saved session
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") && v:this_session == "" | NERDTree | endif

" Open NerdTree when vim starts up opening a dir
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

" Close if only window is a NerdTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

