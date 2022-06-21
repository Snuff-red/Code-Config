syntax on

set number

set cursorline

set hlsearch
set nocompatible
let mapleader=","
inoremap <leader>w <Esc>:w<cr>

inoremap jj <Esc>`^

noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> [n :bnext<CR>

inoremap <C-d> <Esc>ddi

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

nnoremap <leader>v :NERDTree<CR>
nnoremap <leader>g :NERDTreeToggle<CR>

nmap ss <Plug>(easymotion-s2)

"quickrun
let g:quickrun_config = {
\   "_" : {
\       "outputter" : "message",
\   },
\}
let g:quickrun_no_default_key_mappings = 1

"nerdtree-git
let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'✹',
                \ 'Staged'    :'✚',
                \ 'Untracked' :'✭',
                \ 'Renamed'   :'➜',
                \ 'Unmerged'  :'═',
                \ 'Deleted'   :'✖',
                \ 'Dirty'     :'✗',
                \ 'Ignored'   :'☒',
                \ 'Clean'     :'✔︎',
                \ 'Unknown'   :'?',
                \ }
		
"vimspecter
let g:vimspector_enable_mappings = 'HUMAN'

call plug#begin()
Plug 'mhinz/vim-startify'
Plug 'kien/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-surround'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'brooth/far.vim'
Plug 'lfv89/vim-interestingwords'
Plug 'preservim/tagbar'
Plug 'sbdchd/neoformat'
Plug 'dense-analysis/ale'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'christoomey/vim-tmux-navigator'
Plug 'thinca/vim-quickrun'
Plug 'iamcco/markdown-preview.vim'
Plug 'ferrine/md-img-paste.vim'
Plug 'ycm-core/YouCompleteMe'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'puremourning/vimspector'
Plug 'godlygeek/tabular'
Plug 'preservim/vim-markdown'

call plug#end()


