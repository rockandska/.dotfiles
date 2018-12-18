""""""""""""
" Mappings
""""""""""""

let mapleader = ","
map <space> <leader>

" Show tabs and trailing spaces
nmap <silent> <leader>s :set nolist!<CR>

" Close buffer but not the window (if not in NERDTree)
nnoremap <expr> <leader>q (@% =~# '^NERD_tree_') ? '':':b#<bar>bd#<bar>enew<CR>'

" Clear search pattern
nmap <silent> <leader><ESC> :let @/=''<CR>

" Refresh caches ( NerdTree , CtrlP caches )
nmap <Leader>r :NERDTreeFocus<cr>R<c-w><c-p>:CtrlPClearCache<cr>

" Replicate Select-All with Ctrl+A
" noremap <C-a> gg0VG$
" imap    <C-a> <ESC><C-a>

" Write file using sudo by Leader + W
cmap <silent> w!! :SudoWrite<cr>

"====[ Swap v and CTRL-V, because Block mode is more useful that Visual mode "]======

nnoremap    v   <C-V>
nnoremap <C-V>     v

vnoremap    v   <C-V>
vnoremap <C-V>     v

" NERDTree
nnoremap <expr> - (filereadable(resolve(expand('%:p')))) ? ':NERDTreeFind %<CR>' : ':NERDTreeToggle<Enter>'
