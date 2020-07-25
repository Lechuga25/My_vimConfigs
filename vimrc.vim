"some basic configurations
syntax on
set nu
set relativenumber
set noswapfile
set nobackup
set smartindent
set completeopt-=preview
set modelines=0
set ruler
set encoding=utf-8



" Plugins here
call plug#begin('~/.vim/plugged')

Plug 'valloric/youcompleteme'
Plug 'omnisharp/omnisharp-vim'
Plug 'tpope/vim-fugitive'
Plug 'morhetz/gruvbox'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'vim-airline/vim-airline'
Plug 'junegunn/fzf', { 'do' : { -> fzf#install() } }
Plug 'mbbill/undotree'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()




" color scheme
colorscheme gruvbox
set background=dark


" key mapping
nmap <C-n> :NERDTreeToggle <CR>
nnoremap <silent> <leader>fs <CR>
nnoremap <silent> <space>gd :YcmCompleter GoTo<CR>
nnoremap <silent> <space>gb <CR> 
nnoremap <silent> <F12> :pc <CR> 
nnoremap <silent> <F5> :UndotreeToggle <CR>
nnoremap <F10> O<Esc><Esc>

:imap ññ <Esc>
