" ----------------------------------------------------------------------------
"  PLUGIN KEY MAP
" ----------------------------------------------------------------------------
" Plugin: EasyAlign
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga :EasyAlign

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga :EasyAlign

" Plugin: NERDTree
map <Leader>nn :NERDTreeToggle<cr>
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

" Plugin: GIT
noremap <Leader>gc :Gcommit<CR>
noremap <Leader>gsh :Gpush<CR>
noremap <Leader>gll :Gpull<CR>
noremap <Leader>gs :Gstatus<CR>
noremap <Leader>gr :Gremove<CR>
noremap <Leader>ga :Git add -A<CR>
noremap <Leader>gd :Gdiff<CR>
noremap <Leader>gl :Glog<CR>
noremap <Leader>gp :Gpush<CR>
noremap <Leader>gr :Gread<CR>
noremap <Leader>gw :Gwrite<CR>
noremap <Leader>ge :Gedit<CR>
" ----------------------------------------------------------------------------
" GENERAL KEY MAP
" ----------------------------------------------------------------------------
inoremap jj <ESC>

"jump to start and end of line
noremap H ^
noremap L $
noremap <Leader>; :

" clear search highlights
map <silent> <Leader><cr> :noh<cr>

" switch between the last two files
nnoremap <Leader><Leader> <c-^>

" Fast saving
nmap <Leader>w :w!<cr>

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
map Q  <C-W>q

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
nnoremap <Leader>ev :tabedit $MYVIMRC<CR>

" Buffer
nmap <leader>bn :bnext<CR>
nmap <leader>bp :bprevious<CR>
nmap <leader>bf :bfirst<CR>
nmap <leader>bd :bdelete<CR>

nnoremap ; :

" no movement with arrow keys
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>


" "Back to last position
nnoremap <C-b> <C-o>

"move between buffer
noremap <Leader>h <C-W>h
noremap <Leader>l <C-W>l
noremap <Leader>k <C-W>k
noremap <Leader>j <C-W>j

"move between buffer and terminal buffer
tnoremap <A-h> <C-\><C-n><C-W>h
tnoremap <A-j> <C-\><C-n><C-W>j
tnoremap <A-k> <C-\><C-n><C-W>k
tnoremap <A-l> <C-\><C-n><C-W>l

" Paste with current indentation
nmap <Leader>p ]p

command! Q q " Bind :Q to :q
command! Qall qall
map Q <Nop>  " Disable Ex mode
map K <Nop>  " Disable K looking stuff up

" Pressing <space>ss will toggle and untoggle spell checking
map <Leader>ss :setlocal spell!<cr>

map <Leader>sn ]s
map <Leader>sp [s
map <Leader>sa zg
map <Leader>s? z=

"Remove whitespace from end of lines
map <silent> <F6> :%s/\s\+$//g<CR>

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
