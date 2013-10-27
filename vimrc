" Jack Mottram's ~/.vimrc
" For more details see:
" https://github.com/mottram/dotvim
" TODO
" Finish setting up Lightline

filetype off                   					" Required by Vundle
set rtp+=~/.vim/bundle/vundle/					" Manage plugins with Vundle
call vundle#rc()
Bundle 'gmarik/vundle'

Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'
Bundle 'sjl/gundo.vim'
Bundle 'altercation/vim-colors-solarized'
Bundle 'SirVir/ultisnips'
Bundle 'kien/ctrlp.vim'
Bundle 'godlygeek/tabular'
Bundle 'SirVer/ultisnips'
Bundle 'vimoutliner/vimoutliner'
Bundle 'godlygeek/tabular'
Bundle 'itchyny/lightline.vim'
Bundle 'davidoc/taskpaper.vim'
Bundle 'sjl/clam.vim'
Bundle 'ervandew/supertab'
Bundle 'scrooloose/nerdtree'
Bundle 'jistr/vim-nerdtree-tabs'
Bundle 'itspriddle/vim-marked'
Bundle 'tomtom/tcomment_vim'

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
set relativenumber                                              " Relative numbers (except for the current line)
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

map Y y$                                                        " Yank to the end of the line w/ Y
map <leader>nt :tabnew<CR>                                      " New tab w/ ,nt
nmap <leader>w :w!<CR>                                          " Write file with ,w      
map <F2> :NERDTreeTabsToggle<CR>                                " Show the directory tree with <F2>
map <F4> :setlocal spell spelllang=en_gb<CR>                    " Turn on spellcheck with <F4>
map <F5> :set nospell<CR>                                       " Turn off spellcheck with <F5>
set pastetoggle=<F6>                                            " Toggle paste mode with <F6>
map <F7> :set complete+=k<CR>                                   " Turn dictionary autocomplete on...
map <S-F7> :set complete=-k<CR>                                 " ... and off
nnoremap <F3> :GundoToggle<CR>                                  " Show the undo tree w/ <F3>
nmap <silent> ,/ :nohlsearch<CR>                                " Turn off search highlights w/ ,/
nmap <leader>fr :%! ~/bin/formd -r<CR>                          " Convert inline Markdown links to reference...
nmap <leader>fi :%! ~/bin/formd -i<CR>                          " ... and vice versa

au BufRead,BufNewfile ~/notes/* set filetype=markdown           " All files in ~/notes are Markdown
au BufRead,BufNewfile ~/Dropbox/Taskpaper/* set filetype=taskpaper " All files in ~/taskpaper are Taskpaper
au BufWinLeave *.html,*.css mkview	
au BufWinEnter *.html,*.css silent loadview	
au FileType mail set tw=65                                      " Thin width when writing mail in mutt 

let g:UltiSnipsExpandTrigger="<tab>"                            " Use <tab> to trigger UltiSnips
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

let g:ctrlp_map = '<C-X>'                                       " Use <C-X> for CtrlP

let g:nerdtree_tabs_open_on_gui_startup=0                       " Don't open NERDTree tab in MacVim

let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component': {
      \   'readonly': '%{&filetype=="help"?"":&readonly?"⭤":""}',
      \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
      \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
      \ },
      \ 'component_visible_condition': {
      \   'readonly': '(&filetype!="help"&& &readonly)',
      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
      \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
      \ },
      \ 'separator': { 'left': '⮀', 'right': '⮂' },
      \ 'subseparator': { 'left': '⮁', 'right': '⮃' }
      \ }


