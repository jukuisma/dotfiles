set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'https://github.com/tpope/vim-surround.git'
Plugin 'https://github.com/tpope/vim-commentary.git'
Plugin 'https://github.com/altercation/vim-colors-solarized.git'
Plugin 'https://github.com/FooSoft/vim-argwrap.git'
Plugin 'preservim/nerdtree'
Plugin 'ctrlpvim/ctrlp.vim'

call vundle#end()

set nocompatible
syntax on
filetype plugin indent on

set nomodeline
set hidden
set wildmenu
set showcmd
set hlsearch
set ignorecase
set smartcase
set backspace=indent,eol,start
set autoindent
set nostartofline
set ruler
set laststatus=2
set confirm
set visualbell
set t_vb=
set mouse=a
set cmdheight=2
set number
set notimeout ttimeout ttimeoutlen=200
set shiftwidth=4
set softtabstop=4
set expandtab
set cc=80
set number relativenumber
set nu rnu
set ff=unix
" set pastetoggle=<F2> " use <leader>p instead
" set list
" set listchars=nbsp:?

" Set leader to space
let mapleader = "\<Space>"

" Map system clipboard yanking and pasting
map <leader>y "+y
map <leader>p "+p

" File commands
map <leader>fj :e #<CR>
map <leader>fe :NERDTreeToggle<CR>
map <leader>ft :terminal<CR>
map <leader>ff <C-p>
map <leader><leader> <C-p>

" Run norm command
map <C-n> :norm<Space>

" Faster navigation
map J }
map K {
map H b
map L w

" Splitting arguments
nnoremap gs :ArgWrap<CR>

" Highlighting
nnoremap <C-L> :noh<CR><C-L>
nnoremap <silent> <F5> :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>

" Alt window navigation
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>
nmap <silent> <S-Up> :wincmd K<CR>
nmap <silent> <S-Down> :wincmd J<CR>
nmap <silent> <S-Left> :wincmd H<CR>
nmap <silent> <S-Right> :wincmd L<CR>

" Theme
let g:solarized_termcolors=256
set background=dark
colorscheme solarized

" ctlrp setup
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'a'

" NERDTree
autocmd vimenter * NERDTree
autocmd vimenter * wincmd l
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
