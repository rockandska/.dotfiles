call NERDTreeAddKeyMap({
	\ 'key': '<Left>',
	\ 'scope': 'Node',
	\ 'callback': 'NerdNestedClose',
	\ 'quickhelpText': 'Moving up to the previous directory' })


" FUNCTION: s:NerdCloseDir(target) {{{1
function! NerdCloseDir(node)
	if a:node.isRoot()
		call nerdtree#echo('cannot close parent of tree root')
		return
	endif

	let l:parent = a:node.parent

	while l:parent.isCascadable()
		let l:parent = l:parent.parent
	endwhile

	if l:parent.isRoot()
		call nerdtree#echo('cannot close tree root')
		return
	endif

	call l:parent.close()
	call b:NERDTree.render()
	call l:parent.putCursorHere(0, 0)
	return
endfunction

" FUNCTION: s:NerdNestedClose(target) {{{1
function! NerdNestedClose(node)
	if a:node.path.isDirectory
		if a:node.isOpen
			call a:node.activate()
			return
		else
			call NerdCloseDir(a:node)
			return
		endif
	else
		call NerdCloseDir(a:node)
		return
	endif
endfunction
