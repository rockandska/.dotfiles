augroup ProjectDrawer
  autocmd!
  autocmd VimEnter * :NERDTreeToggle
  " Jump to the main window.
  autocmd VimEnter * wincmd p
augroup END

""""""""""""
" Mappings
""""""""""""

let mapleader = ","

" Show tabs and trailing spaces
nmap <silent> <leader>s :set nolist!<CR>

" Close buffer but not the window (if not in NERDTree)
nnoremap <expr> <leader>q (@% =~# '^NERD_tree_') ? '':':Bdelete<CR>'

" Clear search pattern on insert mode
"autocmd InsertEnter * :let @/=''
