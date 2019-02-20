""""""""""""""""""""""
" Windows management "
""""""""""""""""""""""
call submode#enter_with('window', 'n', '', '<C-w>')
for key in ['c','h','j','k','l','s','v','w']
  " maps lowercase, uppercase and <C-key>
  call submode#map('window', 'n', '', key, '<C-w>' . key)
  call submode#map('window', 'n', '', toupper(key), '<C-w>' . toupper(key))
  call submode#map('window', 'n', '', '<C-' . key . '>', '<C-w>' . '<C-'.key . '>')
endfor

call submode#map('window', 'n', '', '<left>', '<C-w>h')
call submode#map('window', 'n', '', '<right>', '<C-w>l')
call submode#map('window', 'n', '', '<down>', '<C-w>j')
call submode#map('window', 'n', '', '<up>', '<C-w>k')
call submode#map('window', 'n', '', '<C-left>', '<C-w>H')
call submode#map('window', 'n', '', '<C-right>', '<C-w>L')
call submode#map('window', 'n', '', '<C-down>', '<C-w>J')
call submode#map('window', 'n', '', '<C-up>', '<C-w>K')

" Go through symbols. Sadly, '|', not supported in submode plugin.
for key in ['=','_','+','-','<','>']
  call submode#map('window', 'n', '', key, '<C-w>' . key)
endfor
