" Jack Mottram's ~/.vimrc
" For more details see:
" https://github.com/mottram/dotvim

call pathogen#runtime_append_all_bundles()                      " Pathogen manages plugins
call pathogen#helptags()

set term=$TERM                                                  
if &term == "linux"                                             " If I'm on a TTY, use miro8
    colorscheme miro8
else
    set t_Co=256                                                " If I have 256 colours, use Solarized
    set background=dark
    colorscheme solarized
endif

if has("gui_running")                                           " No hideous toolbar in MacVim
    set guioptions=-t
endif

set nocompatible                                                " No need for vi compatability
set hidden                                                      " Hide buffers
set number                                                      " Line numbering
set autoindent                                                  " Autoindent...
set smartindent                                                 " ...smartly
set confirm                                                     " Confirmation required
set history=1000                                                " Remember plenty of commands
set incsearch                                                   " Search incrementally
set hlsearch                                                    " Highlight search terms
set ignorecase                                                  " Case insensitive search...
set smartcase                                                   " ...for lower case seach terms
set laststatus=2
set mouse=a                                                     " Enable mouse support
set showcmd                                                     " Show the command I'm typing
set ruler                                                       " Show line/column position
set nobackup                                                    " No ~ backup files
set writebackup                                                 " Make temporary backups
set backupdir=~/.vim/backup
set directory=~/.vim/temp
set undodir=~/.vim/undo                                         " Keep undo history
set undofile 
set wildmenu                                                    " Command autocompletion
set wildignore+=.DS_Store                                       " Never show me DS_Store files
set nomodeline                                                  " Security
set tabpagemax=20                                               " Set maximum no. of 'vim -p' tabs to 20
set showtabline=2                                               " Always show tabs
set showmatch	                                                " Highlight matching brackets
set ffs=unix,mac                                                " Unix and Mac file formats
set guifont=Monaco:h12                                          " 10pt Monaco in MacVim
set tabstop=4                                                   " Tab settings...
set shiftwidth=4
set softtabstop=4
set smarttab 
set expandtab
set dictionary=/usr/share/dict/words                            " Spelling dictionary
set clipboard=unnamed                                           " System clipboard integration
set ttyfast                                                     " Improves redrawing in xterm et al
syntax on                                                       " Syntax highlighting
filetype indent plugin on                                       " Filetype detection

let mapleader=","                                               " Use , as Leader
let gmapleader=","
let g:yankring_history_dir='$HOME/.yr/'                         " YankRing settings
let g:yankring_clipboard_monitor=1
let g:Powerline_colorscheme="skwp"                              " Powerline settings
if has("macunix")
    let g:Powerline_symbols = 'fancy'
endif

map Y y$                                                        " Yank to the end of the line w/ Y
map <leader>nt :tabnew<CR>                                      " New tab w/ ,nt
nmap <leader>w :w!<CR>                                          " Write file with ,w      
map <F2> :NERDTreeTabsToggle<CR>                                " Show the directory tree with <F2>
map <F4> :setlocal spell spelllang=en_gb<CR>                    " Turn on spellcheck with <F4>
map <F5> :set nospell<CR>                                       " Turn off spellcheck with <F5>
set pastetoggle=<F6>                                            " Toggle paste mode with <F6>
map <F7> :set complete+=k<CR>                                   " Turn dictionary autocomplete on...
map <S-F7> :set complete=-k<CR>                                 " ... and off
map <F8> :YRShow<CR>                                            " Show the YankRing w/ <F8>
nnoremap <F3> :GundoToggle<CR>                                  " Show the undo tree w/ <F3>
nnoremap ; :                                                    " No need to Shift for commands
nmap <silent> ,/ :nohlsearch<CR>                                " Turn off search highlights w/ ,/
map <C-A> :call DWM_New()<CR>                                   " Remap dwm.vim new window to <C-A>
nmap <leader>fr :%! ~/bin/formd -r<CR>                          " Convert inline Markdown links to reference...
nmap <leader>fi :%! ~/bin/formd -i<CR>                          " ... and vice versa


au BufRead,BufNewfile ~/notes/* set filetype=markdown           " All files in ~/notes are Markdown
au BufWinLeave *.html,*.css mkview	
au BufWinEnter *.html,*.css silent loadview	
au FileType mail set tw=65                                      " Thin width when writing mail in mutt 

let g:UltiSnipsExpandTrigger="<tab>"                            " Use <tab> to trigger UltiSnips
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

let g:ctrlp_map = '<C-X>'                                       " Use <C-X> for CtrlP

    
if has('statusline')                                            " Status line with git repo info
  set statusline=%<%f\ 
  set statusline+=%w%h%m%r 
  set statusline+=%{fugitive#statusline()}
  set statusline+=\ [%{&ff}/%Y]  
  set statusline+=\ [%{getcwd()}]
  set statusline+=%=%-14.(Line:\ %l\ of\ %L\ [%p%%]\ -\ Col:\ %c%V%)
endif
