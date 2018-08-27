" indent quides
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
hi IndentGuidesOdd  ctermbg=black
hi IndentGuidesEven ctermbg=233

let mapleader = ","

" The following will make tabs and trailing spaces visible when requested:
set listchars=tab:>-,trail:.,eol:$
nmap <silent> <leader>s :set nolist!<CR>
