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

" Icons
Plug 'ryanoasis/vim-devicons'

""""""""""""""""
""" Navigation
""""""""""""""""

" File explorer
Plug 'scrooloose/nerdtree'

" Buffer management
Plug 'moll/vim-bbye'

" Initialize plugin system
call plug#end()

" Install plugins if not already installed
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif
