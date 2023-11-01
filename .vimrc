""" Install plugins manager
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

""" Install plugins
call plug#begin('~/.vim/plugged')
Plug 'itchyny/lightline.vim'
Plug 'joshdick/onedark.vim'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-surround'
Plug 'junegunn/fzf', {'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree'
Plug 'vimwiki/vimwiki'
Plug 'itchyny/calendar.vim'
Plug 'tpope/vim-commentary'
call plug#end()

""" Colorscheme
if exists('+termguicolors')
  let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

set laststatus=2
let g:lightline = {
    \ 'colorscheme': 'onedark',
    \ }
set nocompatible
filetype plugin on
syntax on
colorscheme onedark
let g:onedark_termcolors=16
let g:onedark_terminal_italics=1
let g:onedark_hide_endofbuffer=1

""" Common settings
set encoding=UTF-8
set expandtab
set relativenumber
set mouse=a
set ttymouse=sgr
set clipboard=unnamedplus
set number	
set cursorline
set showmatch
set hlsearch
set autoindent
set smartindent
set smartcase
set smarttab
set undolevels=1000
set shiftwidth=2
set tabstop=2

""" Python
au BufNewFile,BufRead *.py
    \ set expandtab       |" replace tabs with spaces
    \ set autoindent      |" copy indent when starting a new line
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4

""" Markdown
au BufNewFile,BufFilePre,BufRead *.md set filetype=markdown

""" NERdTree settings
let NERDTreeQuitOnOpen = 1
let NERDTreeShowHidden = 1

""" fzf settings
let g:fzf_preview_window = ['right:50%', 'ctrl-/']
let g:fzf_files_options = '--preview "(cat {})"'

""" Keymaps
map <C-f> :Files<CR>
map <C-p> :Rg<CR>
map <C-n> :NERDTreeToggle<CR>
inoremap jk <Esc>
inoremap kj <Esc>
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
nnoremap <space> za

""" Notes settings
let g:vimwiki_list = [{'path': '~/notes', 'syntax': 'markdown', 'ext': '.md'}, {'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]
let g:vimwiki_folding = 'custom'
command NotesPush execute "!git add . && git commit -m 'batch update' && git push"
command NotesPull execute "!git checkout -- . && git pull"
au BufEnter ~/notes/{gtd.md} :NotesPull
au BufWritePost ~/notes/* :NotesPush

""" Others
let @d = ":put =strftime('%d.%m.%Y')"

set exrc
set secure
