" ================ General Config ==================== "
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

set number relativenumber
set numberwidth=3
set cursorline
set nostartofline " don't jump to the start of line when scrolling
set history=1000 " Store more history
set showcmd      " Show incomplete cmds
set showmode     " Show current mode
set visualbell   " No sound
set hidden       " Allow buffers to be hidden
                 " without writing to the disk
set textwidth=80 " Hard wrap at 80 characters

syntax on        " Turn on syntax highlighting
