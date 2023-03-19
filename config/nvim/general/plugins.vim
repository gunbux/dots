" Chun's Plugin Configuration
"
" All plugins will be managed by vim-plug, ensure that vim-plug is installed

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('$HOME/.config/nvim/general/plugins')

Plug 'lervag/vimtex'
Plug 'Raimondi/delimitMate'
Plug 'itchyny/lightline.vim'
" Plug 'liuchengxu/eleline.vim'
Plug 'junegunn/goyo.vim'
Plug 'amix/vim-zenroom2'
Plug 'mattn/emmet-vim'
Plug 'preservim/nerdtree'
Plug 'easymotion/vim-easymotion'
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'tpope/vim-commentary'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'easymotion/vim-easymotion'
Plug 'wakatime/vim-wakatime'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'github/copilot.vim'
Plug 'vimwiki/vimwiki'
Plug 'itchyny/calendar.vim'

call plug#end()

colorscheme dracula
