" ----------------------------------------------------------------------------
" GENERAL KEY MAP
" :map for list mappings.
" ----------------------------------------------------------------------------
let mapleader="\<space>"
let maplocalleader="\<space>"

inoremap jj <ESC>

nnoremap ; :

"jump to start and end of line
noremap H ^
noremap L $

" clear search highlights
map <silent> <Leader><cr> :noh<cr>

" switch between the last two files
nnoremap <Leader><Leader> <C-^>

" Fast saving
nmap <silent> <Leader>w :w!<cr>

"move between buffer
noremap <Leader>h <C-W>h
noremap <Leader>l <C-W>l
noremap <Leader>k <C-W>k
noremap <Leader>j <C-W>j

" narrower window
nmap - <C-W><
" wider window
nmap + <C-W>>
" shorter window
nmap _ <C-W>-
" taller window
nmap = <C-W>+

" Open new splits easily
map sv <C-W>v
map ss <C-W>s
map sq <C-W>q

" indent like ST2
nmap <Leader>] >>
nmap <Leader>[ <<
vmap <Leader>[ <gv
vmap <Leader>] >gv

" Navigation
nnoremap gf :vertical wincmd f<CR>

" Buffer Switching with tab
nnoremap <Leader><Tab> :buffer<Space><Tab>
nnoremap <Leader>o :e **/*
nnoremap <Leader>n :Vexplore<CR>

" Tabs
"
" opens a new tab with the current buffer's path
map <Leader>te :tabedit <c-r>=expand("%:p:h")<CR>/
map <Leader>to :tabonly<CR>
map <Leader>tc :tabclose<CR>
map <Leader>tm :tabmove<CR>
map <Leader>tn :tabnext<CR>
map <Leader>tp :tabprevious<CR>
map <Leader><Leader>t :tabnew<CR>
map <Leader>ev :tabedit $MYVIMRC<CR>

" Buffer
nmap <Leader>bn :bnext<CR>
nmap <Leader>bp :bprevious<CR>
nmap <Leader>bf :bfirst<CR>
nmap <Leader>bd :bdelete<CR>

" "Back to last position
nnoremap <C-b> <C-o>

" Paste with current indentation
nmap <Leader>p ]p

command! Qall qall
command! Q q " Bind :Q to :q
noremap <C-q> :confirm qall<CR>
map Q <Nop>  " Disable Ex mode
map K <Nop>  " Disable K looking stuff up

" toggle and untoggle spell checking
map <Leader>ss :setlocal spell!<CR>

" <F9> toggles word wrap
map <F9> :set wrap!<CR>
map <F9> <ESC>:set wrap!<CR>

" Remove crutches in Insert Mode
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>
inoremap <Up> <Nop>

" Remove crutches in Normal Mode
nnoremap <Down> <Nop>
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>
nnoremap <Up> <Nop>

" Remove crutches in Visual Mode
vnoremap <Down> <Nop>
vnoremap <Left> <Nop>
vnoremap <Right> <Nop>
vnoremap <Up> <Nop>

" ----------------------------------------------------------------------------
"  SEARCH x FZF x RIPGREP
" ----------------------------------------------------------------------------
nnoremap <silent> <Leader>fb :Buffers<CR>
nnoremap <silent> <Leader>ff :Files<CR>
nnoremap <silent> <Leader>fl :Lines<CR>
nnoremap <silent> <Leader>fi :Rg<CR>

" ----------------------------------------------------------------------------
"  PLUGIN KEY MAP
" ----------------------------------------------------------------------------
" Plugin: EasyAlign
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga :EasyAlign

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga :EasyAlign

" Plugin: ALE
nnoremap <Leader>a <Plug>(ale_next_wrap)

" Plugin: GOYO
nnoremap <silent> <Leader>z :Goyo<CR>

" Plugin: GIT GUTTER
nnoremap <silent> <Leader>d :GitGutterToggle<CR>

" Plugin: BufExplorer
" "Back to last position
map <Leader>b :BufExplorer<CR>

" Plugin: Undotree
map <Leader>u :UndotreeToggle<CR>

" Plugin: AutoPairs

" Plugin: CoC

" Code Navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

" Plugin: Floaterm
nnoremap <silent> <Leader>t :FloatermNew<CR>
tnoremap <silent> <F7> <C-\><C-n>:FloatermNew<CR>

nnoremap <silent> <F8> :FloatermPrev<CR>
tnoremap <silent> <F8> <C-\><C-n>:FloatermPrev<CR>

nnoremap <silent> <F9> :FloatermNext<CR>
tnoremap <silent> <F9> <C-\><C-n>:FloatermNext<CR>

nnoremap <silent> <F12> :FloatermToggle<CR>
tnoremap <silent> <F12> <C-\><C-n>:FloatermToggle<CR>

