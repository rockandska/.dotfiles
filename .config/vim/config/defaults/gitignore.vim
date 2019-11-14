" ============== Use Gitignore ============== "
function! GetGitIgnoreFiles ()
  let gitignore = '.gitignore'
  if filereadable(gitignore)
    let igstring = ''
    for oline in readfile(gitignore)
      let line = substitute(oline, '\s|\n|\r', '', "g")
      if line =~ '^#' | con | endif
      if line == '' | con  | endif
      if line =~ '^!' | con  | endif
      if line =~ '/$' | let igstring .= "," . line . "*" | con | endif
      let igstring .= "," . line
    endfor
    let execstring = "set wildignore+=".substitute(igstring, '^,', '', "g")
    execute execstring
    return substitute(igstring, '^,', '', "g")
  endif
endfunction

augroup gitignore
    autocmd!
    autocmd VimEnter,BufEnter * execute "set wildignore+=".GetGitIgnoreFiles()
augroup END
