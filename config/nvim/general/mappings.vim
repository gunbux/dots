" Chun's vim bindings
"
" Remap VIM 0 to first non-blank character
map 0 ^

" Escape buttons
inoremap jk <Esc>
inoremap kj <Esc>
inoremap jj <Esc>
inoremap kk <Esc>

" Maps shell commands to hotkeys
nnoremap <leader>d :!mkdir<Space>
nnoremap <leader>m :!mv<Space>%<Space>

" Better split navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Calling splits
nnoremap <leader>h :split<Space>
nnoremap <leader>v :vsplit<Space>

" Tab completion
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

" Toggle highlighting
map <leader>o :setlocal nohlsearch<CR>

" Toggle commenting
map <leader>c :setlocal formatoptions-=cro<CR>
map <leader>C :setlocal formatoptions=cro<CR>

" Keybind for replcing text
noremap S :%S//gI<Left><Left><Left>


" Bindings for plugins
"

" Goyo Keybinds
nnoremap <leader>g :Goyo<CR>

nmap <F11> <plug>MarkdownPreviewToggle

" vimtex compile
nmap <leader>\ <plug>(vimtex-compile)
nmap <F12> <plug>(vimtex-view)

" NERDTree Keybinds
map <leader>f :NERDTreeToggle<Cr>

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

" Fuzzy File Finder Keybinds
map <leader>/ :Files<Cr>

"Easymotion Keybinds
map , <Plug>(easymotion-prefix)
