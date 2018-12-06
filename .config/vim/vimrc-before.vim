set nocompatible

" Use utf-8 if Vim was compliled with multi-byte support
if has("multi_byte")
  if &termencoding == ""
    let &termencoding = &encoding
  endif
  set encoding=utf-8
  setglobal fileencoding=utf-8
endif

if $TERM == "xterm-256color" || $COLORTERM == "gnome-terminal"
  set t_Co=256
endif

" ================ General Config ==================== "
set number relativenumber 
set numberwidth=3      
set cursorline
set history=1000 " Store more history
set showcmd      " Show incomplete cmds
set showmode     " Show current mode
set visualbell   " No sound
set hidden       " Allow buffers to be hidden
                 " without writing to the disk
set textwidth=80 " Hard wrap at 80 characters

syntax on        " Turn on syntax highlighting

" ================ Indentation ====================== "

set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

filetype plugin indent on

" Display whitespace errors as `.'
set listchars=tab:>-,trail:.,eol:$

set nowrap    " Do not wrap lines
set linebreak " Wrap lines when convenient

" =============== Folds / wrapping =============== "

set foldmethod=indent   " Fold based on indent
set foldnestmax=3       " Deepest fold is 3 levels
set nofoldenable        " Don't fold by default

" Highlight long lines
if exists('+colorcolumn')
  set colorcolumn=+1
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif


"" ============== Use Gitignore ============== "
"let gitignore = '.gitignore'
"if filereadable(gitignore)
"  let igstring = ''
"  for oline in readfile(gitignore)
"    let line = substitute(oline, '\s|\n|\r', '', "g")
"    if line =~ '^#' | con | endif
"    if line == '' | con  | endif
"    if line =~ '^!' | con  | endif
"    if line =~ '/$' | let igstring .= "," . line . "*" | con | endif
"    let igstring .= "," . line
"  endfor
"  let execstring = "set wildignore+=".substitute(igstring, '^,', '', "g")
"  execute execstring
"endif

" ================ Search Settings  ================= "

set incsearch  " Highlight as you search
set hlsearch   " Highlight the current search
set ignorecase " Make search case insensitive...
set smartcase  " ... except when we use uppercase letters

"" =========== Custom Commands and keys  ============= "
":command ToJSON %!python -m json.tool
":nmap \l :setlocal number!<CR>
":nmap \p :set paste!<CR>
":nmap j gj
":nmap k gk
