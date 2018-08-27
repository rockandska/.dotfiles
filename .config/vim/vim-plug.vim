" Vim-Plug start
call plug#begin("$XDG_CONFIG_HOME/vim/plugged")

""""""""""""""""
""" LANGUAGES 
""""""""""""""""

" Perl
Plug 'vim-perl/vim-perl'
" Python
Plug 'vim-scripts/indentpython.vim'
" Ruby
Plug 'vim-ruby/vim-ruby'
" Yaml Syntax
Plug 'stephpy/vim-yaml', { 'as': 'stephpy/vim-yaml' }
" Yaml Indent
Plug 'avakhov/vim-yaml', { 'as': 'avakhov/vim-yaml' }

" Multi language matcher
Plug 'adelarsq/vim-matchit'

""""""""""""""""
""" SOFTWARE RELATED
""""""""""""""""
Plug 'tpope/vim-fugitive'

""""""""""""""""
""" Apparence
""""""""""""""""

" Colors
Plug 'tomasr/molokai'
Plug 'altercation/vim-colors-solarized'
" Additional informations
Plug 'vim-airline/vim-airline'
" Numbers
Plug 'jeffkreeftmeijer/vim-numbertoggle'
" Indent guides
Plug 'nathanaelkane/vim-indent-guides'

" File/Buffer manager
Plug 'vifm/vifm.vim', { 'commit': '07377162f9c4da0040d3fc89c0d323ac93565d82'}

" Icons
Plug 'ryanoasis/vim-devicons'


" Initialize plugin system
call plug#end()

autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif
