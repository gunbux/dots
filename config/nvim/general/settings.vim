" Chun's General Vim Settings
"
" Table of Contents
" 1 - General/Basic Settings
" 2 - Vim User Interface
" 3 - Colours and Fonts
" 4 - Files, backups and undo
" 5 - Text, tab and indent related
" 6 - Visual Mode related
" 7 - Moving around, tabs, windows and buffers
" 8 - Status Line
"
" A large part of this vim configuration was taken from amix, brodie, and
" chrisatmachine.
"
" 1. General/Basic Settings
"
" Use UTF-8
set encoding=UTF-8

" Enable Filetype Plugins
filetype plugin on
filetype indent on

" Enable mouse
set mouse=a
" Use system clipboard
set clipboard+=unnamedplus

" Set vim history
set history=500

" Set to autoread when file is changed from the outside
set autoread
au FocusGained,BufEnter * checktime

" Remember the line vim was last on when reopening a file
if has("autocmd")
	  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
  endif

" Set the mapleader
let mapleader=" "

" Quick save/quit options
nnoremap <leader>w :w!<CR>
nnoremap <leader>q :wq<CR>
nnoremap <leader>e :q!<CR>

" Sudo save
cmap w!! w !sudo tee %

" Remove any leading whitespaces
autocmd BufWritePre * %s/\s\+$//e

" Fix splitting
set splitbelow splitright

"2 - Vim User Interface
"
" Turn on wildmenu
set wildmenu
set wildmode=longest,list,full

" Always show current position
set ruler

" Set height of command bar
set cmdheight=1

" Ignore case + smartcase
set ignorecase
set smartcase

" Highlight search
set hlsearch

" Make search more modern
set incsearch

" Don't redraw when using macro
set lazyredraw

" For regex
set magic

" Show matching brackets
set showmatch

" Sets relative number
set number relativenumber

" Vertically center the document when entering insert mode
autocmd InsertEnter * norm zz

" Goyo config - remove if no plugins installed
let g:goyo_width=100
let g:goyo_margin_top = 2
let g:goyo_margin_bottom = 2

" 3 - Colours and fonts
" "
" Enable syntax highlighting
syntax enable on

" Set 256 colours for terminal
set t_Co=256

" Optional UI Improvement
set cursorline
set cursorcolumn
"highlight CursorLine cterm=bold guibg=#2b2b2b
"highlight CursorColumn cterm=bold guibg=#2b2b2b

" 4 - Files, backups and undo
"
" Turn backup off, since most stuff is in Git or other version control
set nobackup
set nowb
set noswapfile

" Sets persistent undo
try
        set undodir=~/.vim_runtime/temp_dirs/undodir
                set undofile
catch
endtry


" 5 - Text, tab and indent related
"
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs
set smarttab

" 1 tab = 2 spaces
set shiftwidth=2
set tabstop=2
set softtabstop=2

set ai "Auto indent
set si "Smart indent
set wrap "Wraps lines

"Linebreak
set lbr
set tw=600


" 6 - Visual mode related
"
" Visual mode pressing * or # searches for current selection
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

" Better tabbing in visual mode
vnoremap < <gv
vnoremap > >gv


" 7 - Moving around, tabs, windows and buffers
"
" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Close the current buffer
map <leader>bd :Bclose<cr>:tabclose<cr>gT

" Close all the buffers
map <leader>ba :bufdo bd<cr>

map <leader>l :bnext<cr>
map <leader>h :bprevious<cr>

" TAB in general mode will move to text buffer
nnoremap <TAB> :bnext<CR>
" SHIFT-TAB will go back
nnoremap <S-TAB> :bprevious<CR>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Use alt + hjkl to resize windows
nnoremap <M-j>    :resize -2<CR>
nnoremap <M-k>    :resize +2<CR>
nnoremap <M-h>    :vertical resize -2<CR>
nnoremap <M-l>    :vertical resize +2<CR>

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove

" Let 'tl' toggle between this and the last accessed tab
let g:lasttab = 1
nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()


" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <C-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers
try
  set switchbuf=useopen,usetab,newtab
    set stal=2
catch
endtry

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" 8 - Status Line
"
" ALways show status line
set laststatus=2
let g:lightline = { 'colorscheme': 'dracula' }

" Format status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c


" 9 - Spell checking
"
" Pressing <leader>ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>


" 10 - Misc
"
" Quickly open a buffer for scribble
map <leader>n :e ~/buffer<cr>

" Quickly open a markdown buffer for scribble
map <leader>x :e ~/buffer.md<cr>


" 11 - Helper Functions
"
function! HasPaste()
      if &paste
                return 'PASTE MODE  '
                    endif
                        return ''
                      endfunction
