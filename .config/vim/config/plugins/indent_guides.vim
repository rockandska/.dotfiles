" indent quides
let g:indent_guides_default_mapping = 0
let g:indent_guides_enable_on_vim_startup = 1

let g:indent_guides_auto_colors = 0

let g:indent_guides_tab_guides = 0
let g:indent_guides_space_guides = 1
let g:indent_guides_soft_pattern = ' '

autocmd ColorScheme * hi IndentGuidesOdd  cterm=bold ctermfg=white ctermbg=233
autocmd ColorScheme * hi IndentGuidesEven cterm=bold ctermfg=white ctermbg=black
