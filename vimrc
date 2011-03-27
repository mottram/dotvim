call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

set hidden
set number
set autoindent
set smartindent
set confirm
set history=1000
set incsearch	" Search incrementally
set ignorecase	" Make search case insensitive...
set smartcase	" ... unless there's capital letters in the search
set laststatus=2	" Always display the status line
set statusline=%-(%F%m%r%h%w%)\ %{&ff}/%Y/%{&encoding}\ %=%(@\%03.3b\ %Ll\ %l,%v\ (%p%%)%) 
set mouse=a
set showcmd
set ruler
set nobackup
set writebackup
set backupdir=~/.vim/backup
set directory=~/.vim/temp



syntax on

if has ("autocmd")
    filetype plugin indent on
endif
