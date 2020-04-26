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

" narrower window
map - <C-W><
" wider window
map + <C-W>>
" shorter window
map _ <C-W>-
" taller window
map = <C-W>+

" Open new splits easily
map sv <C-W>v
map ss <C-W>s
map sq <C-W>q

" indent like ST2
nmap <Leader>] >>
nmap <Leader>[ <<
vmap <Leader>[ <gv
vmap <Leader>] >gv

" Tabs
"
" opens a new tab with the current buffer's path
map <Leader>te :tabedit <c-r>=expand("%:p:h")<cr>/
map <Leader>to :tabonly<cr>
map <Leader>tc :tabclose<cr>
map <Leader>tm :tabmove<cr>
map <Leader>tn :tabnext<cr>
map <Leader>tp :tabprevious<cr>
map <Leader><Leader>t :tabnew<cr>
map <Leader>ev :tabedit $MYVIMRC<CR>

" Buffer
nmap <leader>bn :bnext<CR>
nmap <leader>bp :bprevious<CR>
nmap <leader>bf :bfirst<CR>
nmap <leader>bd :bdelete<CR>

" "Back to last position
nnoremap <C-b> <C-o>

" Paste with current indentation
nmap <Leader>p ]p

command! Qall qall
command! Q q " Bind :Q to :q
map Q <Nop>  " Disable Ex mode
map K <Nop>  " Disable K looking stuff up

" toggle and untoggle spell checking
map <Leader>ss :setlocal spell!<cr>

" <F9> toggles word wrap
map <F9> :set wrap!<CR>
map <F9> <ESC>:set wrap!<CR>

nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
vnoremap <up> <nop>
vnoremap <down> <nop>
vnoremap <left> <nop>
vnoremap <right> <nop>

" ----------------------------------------------------------------------------
"  PLUGIN KEY MAP
" ----------------------------------------------------------------------------
" Plugin: EasyAlign
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga :EasyAlign

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga :EasyAlign

" Plugin: NERDTree
map <Leader>n :NERDTreeToggle<cr>
map <Leader>nb :NERDTreeFromBookmark<cr>
map <Leader>nf :NERDTreeFind<cr>

" Plugin: ALE
nnoremap <Leader>a <Plug>(ale_next_wrap)

" Plugin: GOYO
nnoremap <silent> <Leader>z :Goyo<cr>

" Plugin: GIT GUTTER
nnoremap <silent> <Leader>d :GitGutterToggle<cr>

" Plugin: BufExplorer
" "Back to last position
map <Leader>b :BufExplorer<CR>

" Plugin: FZF
map <silent> <Leader>ff :FZF<cr>

" Plugin: Rg
nnoremap <silent> <Leader>fi :Rg<space>

" Plugin: Undotree
map <Leader>u :UndotreeToggle<CR>
