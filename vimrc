" Jack Mottram's ~/.vimrc
" For more details see:
" https://github.com/mottram/dotvim
call pathogen#runtime_append_all_bundles()                      " Pathogen manages plugins
call pathogen#helptags()
set term=$TERM                                                  
if &term == "linux"                                             " If I'm on a TTY, use miro8
    colorscheme miro8
else
    set t_Co=256                                                " If I have 256 colours, use macvim
    set background=dark
    colorscheme solarized
   "colorscheme macvim
endif
if has("gui_running")                                           " No hideous toolbar in MacVim
    set guioptions=-t
endif
set nocompatible                                                " No need for vi compatability
set hidden 
set number                                                     
set autoindent                                                  " Autoindent...
set smartindent                                                 " ...smartly
set confirm                                                     " Confirmation required
set history=1000                                                " Remember plenty of commands
set incsearch                                                   " Search incrementally
set hlsearch                                                    " Highlight search terms
set ignorecase                                                  " Case insensitive search...
set smartcase                                                   " ...for lower case seach terms
set laststatus=2
set mouse=a
set showcmd
set ruler
set nobackup                                                    " No ~ backup files
set writebackup
set backupdir=~/.vim/backup
set directory=~/.vim/temp
set undodir=~/.vim/undo                                         " Keep undo history
set undofile
set wildmenu
set wildignore+=.DS_Store                                       " Never show me DS_Store files
set nomodeline                                                  " Security
set tabpagemax=20
set showtabline=2
set showmatch	
set ffs=unix,mac
set guifont=Monaco:h12                                          " 12pt Monaco in MacVim
set tabstop=4
set shiftwidth=4
set softtabstop=4
set smarttab
set expandtab
set dictionary=/usr/share/dict/words                            " Spelling dictionary
set clipboard=unnamed
set ttyfast                                                     " Improves redrawing in xterm et al
syntax on                                                       " Syntax highlighting
filetype indent plugin on                                       " 
let mapleader=","                                               " Use , as Leader
let gmapleader=","
map Y y$                                                        " Yank to the end of the line w/ Y
map <leader>nt :tabnew<CR>                                      " New tab w/ ,nt
map <leader>jl :JekyllLink<CR>                                  " Jekyll plugin stuff
map <leader>jp :JekyllPost<CR> 
map <leader>ji :JekyllPic<CR> 
map <leader>jc :JekyllCommit<CR>        
"map <leader>f :FufFile<CR>                                      " Find files with ,f
nmap <leader>w :w!<cr>
map <F2> :NERDTreeTabsToggle<CR>                                    " Show the directory tree with <F2>
"map <F3> :r !pbpaste<CR>
map <F4> :setlocal spell spelllang=en_gb<CR>                    " Turn on spellcheck with <F4>
map <F5> :set nospell<CR>
set pastetoggle=<F6>
map <F7> :set complete+=k<CR>
map <S-F7> :set complete=-k<CR>                                 
map <F8> :YRShow<CR>                                            " Show the YankRing w/ <F8>
nnoremap <F3> :GundoToggle<CR>                                  " Show the undo tree w/ <F3>
nnoremap ; :
let g:jekyll_path = "~/mottram"                                 " Tell the Jekyll plugin where my blog is
let g:yankring_history_dir='$HOME/.yr/'
let g:yankring_clipboard_monitor=1
autocmd BufRead,BufNewfile ~/notes/* set filetype=markdown      " All files in ~/notes are Markdown
au BufWinLeave *.html,*.css mkview	
au BufWinEnter *.html,*.css silent loadview	
au FileType mail set tw=65                                      " Thin width when writing mail in mutt 
au FocusLost * :wa                                              " Saves file when vim loses focus
let html_use_css = 1                                            " Tell TOhtml to use CSS and XHTML
let use_xhtml = 1                                               
if has('statusline')                                            " Status line with git repo info
  set statusline=%<%f\ 
  set statusline+=%w%h%m%r 
  set statusline+=%{fugitive#statusline()}
  set statusline+=\ [%{&ff}/%Y]  
  set statusline+=\ [%{getcwd()}]
  set statusline+=%=%-14.(Line:\ %l\ of\ %L\ [%p%%]\ -\ Col:\ %c%V%)
endif

let twitvim_enable_perl = 1                                     " Twitter stuff
let twitvim_browser_cmd = 'chromium'
let twitvim_show_header = 0
