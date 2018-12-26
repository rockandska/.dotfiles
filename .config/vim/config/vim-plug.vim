" Vim-Plug start
call plug#begin("$XDG_CONFIG_HOME/vim/plugged")

""""""""""""""""
""" Navigation
""""""""""""""""

" Change root directory
Plug 'airblade/vim-rooter'

" File explorer
Plug 'scrooloose/nerdtree'

" Search files / buffers
Plug 'junegunn/fzf', { 'dir': '~/.local/opt/fzf', 'do': './install --all --xdg --no-update-rc' }
Plug 'junegunn/fzf.vim'

""""""""""""""""
""" LANGUAGES
""""""""""""""""

" Multi language indent / syntex
Plug 'sheerun/vim-polyglot'

" Multi language matcher
Plug 'andymass/vim-matchup'

""""""""""""""""
""" SOFTWARE RELATED
""""""""""""""""

Plug 'tpope/vim-fugitive'

""""""""""""""""
""" Apparence
""""""""""""""""

" Colors
Plug 'tomasr/molokai'

" Additional informations
Plug 'vim-airline/vim-airline'

" Numbers
Plug 'jeffkreeftmeijer/vim-numbertoggle'

" Indent guides
Plug 'rockandska/vim-indent-guides', { 'branch': 'buffer_local_variables' }

" Icons
Plug 'ryanoasis/vim-devicons'

""""""""""""""""
""" Others
""""""""""""""""

Plug 'chrisbra/sudoedit.vim'

" Initialize plugin system
call plug#end()

" Install plugins if not already installed
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif
