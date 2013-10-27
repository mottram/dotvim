" Jack Mottram's ~/.vimrc
" For more details see:
" https://github.com/mottram/dotvim
" TODO Finish setting up Lightline
" TODO Update README
" TODO Organise this vimrc a bit
" TODO Add wildignore settings from
" https://github.com/gregstallings/vimfiles/blob/master/vimrc

" =============================================================================
" Plugin Settings
" =============================================================================

" Load plugins with Vundle
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Plugins to load with Vundle
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
Bundle 'itchyny/lightline.vim'
Bundle 'davidoc/taskpaper.vim'
Bundle 'sjl/clam.vim'
Bundle 'ervandew/supertab'
Bundle 'scrooloose/nerdtree'
Bundle 'jistr/vim-nerdtree-tabs'
Bundle 'itspriddle/vim-marked'
Bundle 'tomtom/tcomment_vim'
Bundle 'maxbrunsfeld/vim-yankstack'

" =============================================================================
" Colourschemes & Appearance
" =============================================================================

" On a TTY, use the miro8 colourscheme
" If 256 colours are available, use Solarized dark
" (This includes MacVim)
set term=$TERM                                                 
if &term == "linux"
    colorscheme miro8
else
    set t_Co=256
    set background=dark
    colorscheme solarized
endif

" Hide buffers
set hidden

" Number lines
set number

" Show relative line numbers (except for the current line)
set relativenumber

" Highlight the current line
set cursorline

" Disable error bells
set noerrorbells

" Remove the hideous toolbar in MacVim
" Set the macmeta option to enable Yankstack keybindings in MacVim
if has("gui_running")
    set guioptions=-t
    set macmeta
endif

" Use comma instead of backslash as leader
let mapleader=","
let gmapleader=","

set nocompatible                                                " No need for vi compatability
set autoindent                                                  " Autoindent...
set smartindent                                                 " ...smartly
set confirm                                                     " Confirmation required
set history=1000                                                " Remember plenty of commands

" =============================================================================
" Search
" =============================================================================

" Highlight search terms
set hlsearch

" Search incrementally
set incsearch

" Case insensitive search...
set ignorecase

" ...for lower case seach terms
set smartcase

" Clear last search highlighting with Return
function! MapCR()
  nnoremap <cr> :nohlsearch<cr>:<backspace>
endfunction
call MapCR()

" Highlight last search term with ,hl
nnoremap <leader>hl :set hlsearch<cr>



set laststatus=2
set mouse=a                                                     " Enable mouse support
set showcmd                                                     " Show the command I'm typing
set ruler                                                       " Show line/column position

" =============================================================================
" Backups & Undo
" =============================================================================

" No ~backup files
set nobackup

" Make temporary backups
set writebackup
set backupdir=~/.vim/backup
set directory=~/.vim/temp

" Keep undo history
set undofile 
set undodir=~/.vim/undo

" =============================================================================
" Copy & Paste
" =============================================================================

" Manage the clipboard with Yankstack
" (Requred to enable remapping of 'Y' below)
call yankstack#setup()

" Cycle through Yankstack's clipboard history
nmap <leader>p <Plug>yankstack_substitute_older_paste
nmap <leader>P <Plug>yankstack_substitute_newer_paste

" Yank to the end of the line with Y
map Y y$

" Integrate vim's clipboard with the system's
set clipboard=unnamed




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
set ttyfast                                                     " Improves redrawing in xterm et al
syntax on                                                       " Syntax highlighting
filetype indent plugin on                                       " Filetype detection


map <leader>nt :tabnew<CR>                                      " New tab with ,nt
nmap <leader>w :w!<CR>                                          " Write file with ,w      
map <F2> :NERDTreeTabsToggle<CR>                                " Show the directory tree with F2
map <F4> :setlocal spell spelllang=en_gb<CR>                    " Turn on spellcheck with F4
map <F5> :set nospell<CR>                                       " Turn off spellcheck with F5
set pastetoggle=<F6>                                            " Toggle paste mode with F6
map <F7> :set complete+=k<CR>                                   " Turn dictionary autocomplete on...
map <S-F7> :set complete=-k<CR>                                 " ... and off
nnoremap <F3> :GundoToggle<CR>                                  " Show the undo tree with F3
nmap <silent> ,/ :nohlsearch<CR>                                " Turn off search highlights with ,/
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


" =============================================================================
" Statusline
" =============================================================================

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
