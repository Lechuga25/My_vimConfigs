"""""""""""""""""
" Basic configuration
"""""""""""""""""
syntax on
set nu
set splitright " Splits to the right
set relativenumber
set noswapfile
set nobackup
set completeopt-=preview
set modelines=0
set ruler
set encoding=UTF-8
set termguicolors
set updatetime=300
set cmdheight=1
"tab to 2 spaces
set smartindent
set tabstop=2
set expandtab " space characters instead of tab
set shiftwidth=2
set mouse=a " Activates mouse, use it if you are afraid
highlight ColorColumn ctermbg=DarkCyan
call matchadd('ColorColumn', '\%81v', 100)


"""""""""""""""""
" Plugins here
"""""""""""""""""
call plug#begin('~/.vim/plugged')
" Plug 'valloric/youcompleteme'
Plug 'omnisharp/omnisharp-vim'
Plug 'tpope/vim-fugitive'
" Gruvbox theme
Plug 'gruvbox-community/gruvbox'
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
" Better js sintax highlight
Plug 'yuezk/vim-js'
" Better ruby highlight
Plug 'vim-ruby/vim-ruby'
" Indent lines
Plug 'Yggdroot/indentLine'
" Debugger / not fully configured yet
Plug 'puremourning/vimspector'
call plug#end()


"""""""""""""""""
" Color scheme 
"""""""""""""""""
colorscheme gruvbox
set background=dark
hi Visual cterm=NONE ctermfg=NONE ctermbg=237 guibg=#3a3a3a



""""""""""""""""
" key mapping
""""""""""""""""
let mapleader = " "
map <leader>n :NERDTreeToggle <CR>
nnoremap <silent> <leader>fs <CR>
inoremap jj <esc>
nnoremap <silent> <space>gb <CR> 
nnoremap <silent> <F5> :UndotreeToggle <CR>
nnoremap <C-s> :w <CR>
" Stop search
map <leader>h :nohlsearch <CR>
" <leader> cc: Comments current line or selected line
" <leader> cu: Uncomments current line or selected line

" Move split to a new tab
map <leader>m <C-w>T
"Move split to right
map <leader>mh <C-w>H
"Move split to left
map <leader>ml <C-w>L
" Move split to down
map <leader>mj <C-w>J
" Move splig to up
map <leader>mk <C-w>K

" Terminal get to normal mode
tnoremap <Esc> <C-\><C-n> 
tnoremap jj <C-\><C-n>

"""""""""""""""""
" Move through tabs
"""""""""""""""""
map <leader>t :tabnew file <CR>
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>


"""""""""""""""
" Spell check
"""""""""""""""
map <F2> :setlocal spell! spelllang=en_us<CR>
set splitbelow splitright
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l



""""""""""""""
" Commands
""""""""""""""
command! Html :0r $HOME/.vim/templates/skeleton.html



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


""""""""""""""""""""
"Debugger configuration. 
""""""""""""""""""""
let g:vimspector_enable_mappings = 'HUMAN'
map <leader>qi <Plug>VimspectorStepInto 
map <leader>qo <Plug>VimspectorStepOver
map <leader>qO <Plug>VimspectorStepOut

" for normal mode - the word under the cursor
nmap <Leader>di <Plug>VimspectorBalloonEval
" for visual mode, the visually selected text
xmap <Leader>di <Plug>VimspectorBalloonEval
nmap <LocalLeader><F11> <Plug>VimspectorUpFrame
nmap <LocalLeader><F12> <Plug>VimspectorDownFrame
" Changing default signs
sign define vimspectorBP text=o             texthl=WarningMsg
sign define vimspectorBPCond text=o?        texthl=WarningMsg
sign define vimspectorBPLog text=!!         texthl=SpellRare
sign define vimspectorBPDisabled text=o!    texthl=LineNr
sign define vimspectorPC text=\ >           texthl=MatchParen
sign define vimspectorPCBP text=o>          texthl=MatchParen
sign define vimspectorCurrentThread text=>  texthl=MatchParen
sign define vimspectorCurrentFrame text=>   texthl=Special

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

""""""""""""""""""""""""""""""""""""
" CoC ruby
""""""""""""""""""""""""""""""""""""
let g:coc_global_extensions = ['coc-solargraph']


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

nmap <leader>ci  <Plug>(coc-codelens-action)

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

