" Jack Mottram's ~/.vimrc
" For more details see:
" https://github.com/mottram/dotvim

" =============================================================================
" Setup
" =============================================================================

" Use Vim settings, not vi settings
set nocompatible

" Turn off modelines
set nomodeline

" =============================================================================
" Plugins
" =============================================================================

" Load plugins with Vundle
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Vundle must be managed by Vundle!
Bundle 'gmarik/vundle'

" Git wrangling
" https://github.com/tpope/vim-fugitive
Bundle 'tpope/vim-fugitive'

" Easy quoting/parenthesizing
" https://github.com/tpope/vim-surround
Bundle 'tpope/vim-surround'

" Visualise the undo tree
" https://github.com/sjl/gundo.vim
Bundle 'sjl/gundo.vim'

" Pretty colours
" https://github.com/altercation/vim-colors-solarized
Bundle 'altercation/vim-colors-solarized'

" Find files, open buffers, recently used, &c.
" https://github.com/kien/ctrlp.vim
Bundle 'kien/ctrlp.vim'

" Text filtering and alignment
" https://github.com/godlygeek/tabular
Bundle 'godlygeek/tabular'

" Outliner mode
" https://github.com/vimoutliner/vimoutliner
Bundle 'vimoutliner/vimoutliner'

" A fancy statusline
" https://github.com/itchyny/lightline.vim
Bundle 'itchyny/lightline.vim'

" Shell command helper
" https://github.com/sjl/clam.vim
Bundle 'sjl/clam.vim'

" Use tab for completions
" https://github.com/ervandew/supertab
Bundle 'ervandew/supertab'

" Filesystem sidebar
" https://github.com/scrooloose/nerdtree
Bundle 'scrooloose/nerdtree'

" Make NERDTree work independently of tabs
" https://github.com/jistr/vim-nerdtree-tabs
Bundle 'jistr/vim-nerdtree-tabs'

" Taskpaper syntax highlighting
" https://github.com/davidoc/taskpaper.vim
Bundle 'davidoc/taskpaper.vim'

" Markdown syntax highlighting
" https://github.com/tpope/vim-markdown
Bundle 'tpope/vim-markdown'

" Preview Mardkown files in Marked
" https://github.com/itspriddle/vim-marked
Bundle 'itspriddle/vim-marked'

" Toggle comments
" https://github.com/tomtom/tcomment_vim
Bundle 'tomtom/tcomment_vim'

" Clipboard history
" https://github.com/maxbrunsfeld/vim-yankstack
Bundle 'maxbrunsfeld/vim-yankstack'

" Improved matching with %
" https://github.com/edsono/vim-matchit
Bundle 'edsono/vim-matchit'

" =============================================================================
" Filetypes
" =============================================================================

" Unix & Mac Filetypes only
set ffs=unix,mac

" Use utf-8, no BOM
set encoding=utf-8 nobomb

" Detect filetypes
filetype indent plugin on

" All files in the Notes directory  are Markdown
au BufRead,BufNewfile ~/Dropbox/Notes/* set filetype=markdown

" All files in the Taskpaper directory are Taskpaper
au BufRead,BufNewfile ~/Dropbox/Taskpaper/* set filetype=taskpaper

" Set text width to 65 when writing mail in mutt
au FileType mail set tw=65


" =============================================================================
" User Interface
" =============================================================================

" Use comma instead of backslash as leader
let mapleader=","
let gmapleader=","

" Hide buffers
set hidden

" Show line numbers
set number

" Show relative line numbers (except for the current line)
set relativenumber

" Highlight the current line
set cursorline

" Always show the statusline
set laststatus=2

" Show line & column position
set ruler

" Always show tabs
set showtabline=2

" Set maximum no. of tabs to 20
" Applies when opening with vim -p
set tabpagemax=20

" Toggle the NERDTree sidebar with <F2>
map <F2> :NERDTreeTabsToggle<CR>

" Toggle Gundo's undo tree with <F3>
nnoremap <F3> :GundoToggle<CR>

" Open the CtrlP search pane with Control+X
let g:ctrlp_map = '<C-X>'

" Enable mouse support (heresy!)
set mouse=a

" Show incomplete commands 
set showcmd

" Remember plenty of past commands
set history=1000

" Improve tab command completion
set wildmenu

" Ignore DS_Store files
set wildignore+=.DS_Store

" Ignore archives
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz

" Ignore temp and backup files
set wildignore+=*.swp,*~,._*

" Speed up redrawing in some terminals
set ttyfast

" Colourscheme settings
" On a TTY, use the miro8 colourscheme (see http://1tw.org/1deUzmR). If 256
" colours are available, use Solarized dark
set term=$TERM
if &term == "linux"
    colorscheme miro8
else
    set t_Co=256
    set background=dark
    colorscheme solarized
endif

" Macvim settings
if has("gui_running")
" Use 10pt Monaco in MacVim
    set guifont=Monaco:h12
" Remove the hideous toolbar in MacVim
    set guioptions=-t
" Use text dialogs instead of GUI popups
    set guioptions+=c
endif

" Don't open the NERDTree sidebar automatically in MacVim
let g:nerdtree_tabs_open_on_gui_startup=0

" Lightline statusline
" See http://1tw.org/1buK2Sv

if hostname() == 'mbp'

let g:lightline = {
      \ 'colorscheme': 'solarized_dark',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'filename' ] ]
      \ },
      \ 'component_function': {
      \   'fugitive': 'MyFugitive',
      \   'readonly': 'MyReadonly',
      \   'modified': 'MyModified',
      \   'filename': 'MyFilename'
      \ },
      \ 'separator': { 'left': '⮀', 'right': '⮂' },
      \ 'subseparator': { 'left': '⮁', 'right': '⮃' }
      \ }

function! MyModified()
  if &filetype == "help"
    return ""
  elseif &modified
    return "+"
  elseif &modifiable
    return ""
  else
    return ""
  endif
endfunction

function! MyReadonly()
  if &filetype == "help"
    return ""
  elseif &readonly
    return "⭤"
  else
    return ""
  endif
endfunction

function! MyFugitive()
  if exists("*fugitive#head")
    let _ = fugitive#head()
    return strlen(_) ? '⭠ '._ : ''
  endif
  return ''
endfunction

function! MyFilename()
  return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
       \ ('' != expand('%:t') ? expand('%:t') : '[No Name]') .
       \ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction

elseif hostname() == 'pest'

let g:lightline = {
      \ 'colorscheme': 'solarized_dark',
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
      \ }
      \ }


endif

" =============================================================================
" Text Editing, Formatting & Snippets
" =============================================================================

" Indent automatically
set autoindent
set smartindent
set shiftwidth=4

" Tab settings
set tabstop=4
set softtabstop=4
set smarttab
set expandtab

" Make folds persistent
au BufWinLeave *.* mkview
au BufWinEnter *.* silent loadview

" Convert inline Markdown links to references with formd, and vice versa
nmap <leader>fr :%! ~/bin/formd -r<CR>
nmap <leader>fi :%! ~/bin/formd -i<CR>

" Ask before closing unsaved files, &c.
set confirm

" =============================================================================
" Copy & Paste
" =============================================================================

" Manage the clipboard with Yankstack
" (Required or the remapping of 'Y' below won't work)
call yankstack#setup()

" Cycle through Yankstack's clipboard history
nmap <leader>p <Plug>yankstack_substitute_older_paste
nmap <leader>P <Plug>yankstack_substitute_newer_paste

" Set the macmeta option to enable Yankstack keybindings in MacVim
if has("gui_running")
    set macmeta
endif

" Yank to the end of the line with Y
map Y y$

" Integrate with the system clipboard
set clipboard=unnamed

" Toggle paste mode with F6
set pastetoggle=<F6>

" Always exit paste mode when leaving insert mode
au InsertLeave * set nopaste

" =============================================================================
" Search & Highlighting
" =============================================================================

" Highlight search terms
set hlsearch

" Search incrementally
set incsearch

" Make search case insensitive...
set ignorecase

" ...unless there's an upper case character
set smartcase

" Clear last search highlighting with Return
function! MapCR()
    nnoremap <cr> :nohlsearch<cr>:<backspace>
endfunction
call MapCR()

" Highlight last search term with ,hl
nnoremap <leader>hl :set hlsearch<cr>

" Enable syntax highlighting
syntax on

" Highlight matching brackets
set showmatch

" =============================================================================
" Spelling & Dictionary
" =============================================================================

" Set dictionary
set dictionary=/usr/share/dict/words

" Turn on spellcheck with F4
map <F4> :setlocal spell spelllang=en_gb<CR>

" Turn off spellcheck with F5
map <F5> :set nospell<CR>

" Turn dictionary autocomplete on...
map <F7> :set complete+=k<CR>

" ... and off
map <S-F7> :set complete=-k<CR>

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


" Simple statusline
"   set statusline=%<%f\ 
"   set statusline+=%w%h%m%r 
"   set statusline+=%{fugitive#statusline()}
"   set statusline+=\ [%{&ff}/%Y]  
"   set statusline+=\ [%{getcwd()}]
"   set statusline+=%=%-14.(Line:\ %l\ of\ %L\ [%p%%]\ -\ Col:\ %c%V%)
" endif
