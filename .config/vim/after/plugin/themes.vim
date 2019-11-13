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

" Find trailing & before-tab spaces and highlight them - then do the
" same for each buffer and colorscheme in gui / macvim
hi ColorColumn term=reverse ctermbg=236
hi NonText ctermfg=red
hi TrailingSpaces cterm=bold ctermfg=white ctermbg=red

autocmd FileType * call MatchTrailingSpaces()

function MatchTrailingSpaces(...)
  if get(a:, 1, 1) == 0
    if exists('w:mtrailingspaces')
      call matchdelete(w:mtrailingspaces)
    endif
  elseif exists('w:notrailingspaces') && w:notrailingspaces == 1
    unlet w:notrailingspaces
    if exists('w:mtrailingspaces')
      call matchdelete(w:mtrailingspaces)
      unlet w:mtrailingspaces
    endif
  else
    if !exists('w:mtrailingspaces')
      let w:mtrailingspaces=matchadd('TrailingSpaces','\s\+$\| \+\ze\t\|\%xa0\|^\s\+', -1)
    endif
  endif
endfunction

" Highlight long lines
if exists('+colorcolumn')
  set colorcolumn=+1
else
  au BufEnter,WinEnter,FileType * if !exists('w:mlonglines') | let w:mlonglines=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif
