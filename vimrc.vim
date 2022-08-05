"""""""""""""""""
" Basic configuration
"""""""""""""""""
syntax on
set nu
set splitright          " Splits to the right
set relativenumber      " Sets left line number display to relative
set noswapfile          " No swap file
set nobackup            " No backup
set completeopt-=preview
set modelines=0
set ruler
set encoding=UTF-8
set termguicolors       " Set colors / if not set colors may change
set updatetime=300
set cmdheight=1         " comand line height set to 1

"tab to 2 spaces
set smartindent
set tabstop=2
set expandtab           " space characters instead of tab
set shiftwidth=2
set mouse=a             " Activates mouse, use it if you are afraid

filetype on
filetype indent on
filetype plugin on

" highlight characters over 100 character limit
highlight ColorColumn ctermbg=DarkCyan
call matchadd('ColorColumn', '\%81v', 100)


"""""""""""""""""
" Plugins here
"""""""""""""""""
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-fugitive'         " Git
Plug 'gruvbox-community/gruvbox'  " Gruvbox theme
Plug 'scrooloose/nerdtree'        " Nav panel
Plug 'scrooloose/syntastic'       " Syntax checking
Plug 'vim-airline/vim-airline'    " Bottom command line improved
Plug 'mbbill/undotree'            " Undo tree
Plug 'maksimr/vim-jsbeautify'     " Format js and html files
Plug 'mhinz/vim-startify'         " Start screen
Plug 'liuchengxu/vim-which-key'   " Key binding helper
Plug 'preservim/nerdcommenter'    "Easy commenter
Plug 'yuezk/vim-js'               " Better js sintax highlight
Plug 'vim-ruby/vim-ruby'          " Better ruby sintax highlight
Plug 'ngmy/vim-rubocop'           " Ruby rubocop
Plug 'Yggdroot/indentLine'        " Easy indent
Plug 'puremourning/vimspector'    " Debugger / TODO: configure
Plug 'junegunn/fzf', { 'do' : { -> fzf#install() } }  " Fuzzy finder 
Plug 'neoclide/coc.nvim', {'branch': 'release'}       " Autocomplete
call plug#end()


"""""""""""""""""
" Color scheme 
"""""""""""""""""
let g:gruvbox_invert_selection = 0    " No weird background colors in visual mode
let g:gruvbox_contrast_dark = 'hard'  " Darker background
colorscheme gruvbox                   " User Gruvbox colorscheme
set background=dark                   " Dark background as default
" Visual mode better less bright highlight
hi Visual cterm=NONE ctermfg=NONE ctermbg=237 guibg=#3a3a3a

" Ruby sintax config
let ruby_operators = 1
let ruby_pseudo_operators = 1


""""""""""""""""
" key mapping
""""""""""""""""
let mapleader = " "                   " Space bar as <leader> key
map <leader>n :NERDTreeToggle <CR> 
nnoremap <silent> <leader>fs <CR>
inoremap jj <esc>
nnoremap <silent> <leader><F4> :UndotreeToggle <CR>
nnoremap <leader>fs :w <CR>
" Fuzzy finder
nnoremap <leader>F :FZF <CR>
" Stop search
map <leader>h :nohlsearch <CR>
" <leader> cc: Comments current line or selected line
" <leader> cu: Uncomments current line or selected line
let g:vimrubocop_keymap = 0
nmap <Leader>r :RuboCop<CR>


""""""""""""""""
" Splits
"""""""""""""""
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

" Populate the file with the html tamplate.
command! Html :0r $HOME/.vim/templates/skeleton.html


""""""""""""""""""""""""""""""""""""""""
" Bookmarks.
""""""""""""""""""""""""""""""""""""""""
let g:startify_lists = [
          \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
          \ { 'type': 'files',     'header': ['   Recent'  ]       },
          \ { 'type': 'sessions',  'header': ['   Sessions']       },
          \ { 'type': 'commands',  'header': ['   Commands']       },
          \ ]
let g:startify_custom_header = []             " Erases startify header


" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"


""""""""""""""""""""
"Debugger configuration. 
""""""""""""""""""""
let g:vimspector_enable_mappings = 'HUMAN'        " TODO: Configure mappings
map <leader>qi <Plug>VimspectorStepInto
map <leader>qo <Plug>VimspectorStepOver
map <leader>qO <Plug>VimspectorStepOut

" for normal mode - the word under the cursor
nmap <Leader>di <Plug>VimspectorBalloonEval
" for visual mode, the visually selected text
xmap <Leader>di <Plug>VimspectorBalloonEval
nmap <LocalLeader><F11> <Plug>VimspectorUpFrame
nmap <LocalLeader><F12> <Plug>VimspectorDownFrame
" Changing default signs to characters
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
