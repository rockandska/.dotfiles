" ================ Themes  ================= "
try
  colorscheme molokai
  set background=dark
catch
endtry

" =========== Highlights ============

hi Error term=reverse cterm=bold ctermfg=7 ctermbg=1 guifg=White guibg=Red
hi ErrorMsg term=reverse cterm=bold ctermfg=7 ctermbg=1 guifg=White guibg=Red

hi LineNr ctermbg=236 ctermfg=white
hi CursorLineNr ctermbg=Yellow ctermfg=black

hi IndentGuidesOdd  cterm=bold ctermfg=white ctermbg=233
hi IndentGuidesEven cterm=bold ctermfg=white ctermbg=black

" Find trailing & before-tab spaces and highlight them - then do the
" same for each buffer and colorscheme in gui / macvim
" hi ExtraWhitespace ctermfg=blue ctermbg=7 guibg=grey
hi ColorColumn term=reverse ctermbg=236
hi NonText ctermfg=red
hi TrailingSpaces cterm=bold ctermfg=white ctermbg=red

au BufEnter,WinEnter,FileType * let w:m3=matchadd('TrailingSpaces','\s\+$\| \+\ze\t\|\%xa0\|^\s\+', -1)

" Highlight long lines
if exists('+colorcolumn')
  set colorcolumn=+1
else
  au BufEnter,WinEnter,FileType * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif
