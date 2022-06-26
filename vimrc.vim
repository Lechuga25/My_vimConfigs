"""""""""""""""""
" Basic configuration
"""""""""""""""""
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
set cmdheight=1


"""""""""""""""""
" Plugins here
"""""""""""""""""
call plug#begin('~/.vim/plugged')
" Plug 'valloric/youcompleteme'
Plug 'omnisharp/omnisharp-vim'
Plug 'tpope/vim-fugitive'
" Gruvbox theme
Plug 'morhetz/gruvbox'
" Nav panel
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
" Bottom command line improved
Plug 'vim-airline/vim-airline'
" Finder
Plug 'junegunn/fzf', { 'do' : { -> fzf#install() } }
" Undo tree
Plug 'mbbill/undotree'
" Autocomplete
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Format js and html files
Plug 'maksimr/vim-jsbeautify'
" Start screen
Plug 'mhinz/vim-startify'
" Key binding helper
Plug 'liuchengxu/vim-which-key'
"Easy commenter
Plug 'preservim/nerdcommenter'
call plug#end()



"""""""""""""""""
" Color scheme 
"""""""""""""""""
colorscheme gruvbox
set background=dark



""""""""""""""""
" key mapping
""""""""""""""""
let mapleader = " "
map <leader>n :NERDTreeToggle <CR>
map <leader>t :tabnew file <CR>
nnoremap <silent> <leader>fs <CR>
inoremap jj <esc>
" nnoremap <silent> <space>gd :YcmCompleter GoTo<CR>
nnoremap <silent> <space>gb <CR> 
nnoremap <silent> <F5> :UndotreeToggle <CR>
" <leader> cc: Comments current line or selected line
" <leader> cu: Uncomments current line or selected line



"""""""""""""""
"Spell check
"""""""""""""""
map <F6> :setlocal spell! spelllang=en_us<CR>
set splitbelow splitright
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l



""""""""""""""""""""""""""""""""""""""""
" Bookmarks. Syntax is clear.add yours
""""""""""""""""""""""""""""""""""""""""
" let g:startify_bookmarks = [ {'I': '~/i3/i3/config'},{'L': '~/.blerc'},{'Z': '~/.zshrc'},{'B': '~/.bashrc'},{'V': '~/.vimrc'}]
let g:startify_lists = [
          \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
          \ { 'type': 'files',     'header': ['   Recent'  ]       },
          \ { 'type': 'sessions',  'header': ['   Sessions']       },
          \ { 'type': 'commands',  'header': ['   Commands']       },
          \ ]
" Erases startify header
let g:startify_custom_header = []



" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"



""""""""""""""""""""""""""
" COC map configuration
""""""""""""""""""""""""""
" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)



"""""""""""""""""""""""""""""""""""""""""""""""""
" Use K to show documentation in preview window.
"""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Highlight the symbol and its references when holding the cursor.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd CursorHold * silent call CocActionAsync('highlight')



" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end



"""""""""""""""""""""""""""""""""""""""""""""""""
" Run the Code Lens action on the current line.
"""""""""""""""""""""""""""""""""""""""""""""""""
nmap <leader>cl  <Plug>(coc-codelens-action)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Mappings for CoCList
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
