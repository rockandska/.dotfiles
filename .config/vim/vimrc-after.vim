" indent quides
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
hi IndentGuidesOdd  ctermbg=black
hi IndentGuidesEven ctermbg=233

" tabs / trailing space etc...
set listchars=tab:>-,trail:.,eol:$


""""""""""""""
" Mapping
""""""""""""""

"""""
" Core
"""""

let mapleader = ","

" The following will make tabs and trailing spaces visible when requested:
nmap <silent> <leader>s :set nolist!<CR>
