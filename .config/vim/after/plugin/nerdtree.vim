function! NerdRightOpen(node)
  if a:node.path.isDirectory
    if ! a:node.isOpen
        call a:node.activate()
        let plop = a:node.getVisibleChildren()
        if len(plop) > 0
          execute "normal +"
        endif
    endif
  endif
endfunction

function! NerdLeftClose(node)
  if a:node.path.isDirectory
    if a:node.isOpen
      call a:node.activate()
      return
    else
      execute 'normal' g:NERDTreeMapCloseDir
      return
    endif
  else
      execute 'normal' g:NERDTreeMapCloseDir
      return
  endif
endfunction

call NERDTreeAddKeyMap({
  \ 'key': '<Left>',
  \ 'scope': 'Node',
  \ 'callback': 'NerdLeftClose',
  \ 'quickhelpText': 'Close current directory' })

call NERDTreeAddKeyMap({
  \ 'key': 'h',
  \ 'scope': 'Node',
  \ 'callback': 'NerdLeftClose',
  \ 'quickhelpText': 'Close current directory' })

call NERDTreeAddKeyMap({
  \ 'key': '<Right>',
  \ 'scope': 'Node',
  \ 'callback': 'NerdRightOpen',
  \ 'quickhelpText': 'Open current directory' })

call NERDTreeAddKeyMap({
  \ 'key': 'l',
  \ 'scope': 'Node',
  \ 'callback': 'NerdRightOpen',
  \ 'quickhelpText': 'Open current directory' })
