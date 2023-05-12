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
" inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

" Toggle highlighting
map <leader>o :setlocal nohlsearch<CR>

" Toggle commenting
" map <leader>c :setlocal formatoptions-=cro<CR>
" map <leader>C :setlocal formatoptions=cro<CR>

" Keybind for replcing text
" noremap S :%S//gI<Left><Left><Left>


" Bindings for plugins

" Vimwiki
let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]

map  <C-Space> :VimwikiIndex<CR>

" Copilot
imap <silent><script><expr> <C-Space> copilot#Accept("\<CR>")
let g:copilot_no_tab_map = v:true

" Vimwiki Related Keybinds

" Enable GCal
source ~/.cache/calendar.vim/credentials.vim
let g:calendar_google_calendar = 1

" Hotkey for Calendar
map <leader>c :Calendar -view=days -split=vertical -position=right<CR>

" Helper Function for integration with calendar
function! s:prefix_zero(num) abort
  if a:num < 10
    return '0'.a:num
  endif
  return a:num
endfunction

" Callback function for Calendar.vim
function! DiaryDay(day, month, year, week, dir, wnum) abort
  let day = s:prefix_zero(a:day)
  let month = s:prefix_zero(a:month)

  let link = a:year.'-'.month.'-'.day
  if winnr('#') == 0
    if a:dir ==? 'V'
      vsplit
    else
      split
    endif
  else
    wincmd p
    if !&hidden && &modified
      new
    endif
  endif

  call vimwiki#diary#make_note(a:wnum, 0, link)
endfunction

autocmd FileType calendar nmap <leader><buffer> <CR> :call DiaryDay(b:calendar.day().get_day(), b:calendar.day().get_month(), b:calendar.day().get_year(), b:calendar.day().week(), "V", v:count1)<CR>

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
