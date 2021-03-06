" Jack Mottram's ~/.vimrc 
" For more details see:
" https://github.com/mottram/dotvim
" Setup {{{
" Use Vim settings, not vi settings
set nocompatible
" Turn off modelines
set nomodeline
" Use a group for autocommands
augroup vimrc
    autocmd!
augroup END
" }}}
" Plugins {{{
call plug#begin('~/.vim/plugged')
Plug 'roman/golden-ratio'
Plug 'airblade/vim-gitgutter'
Plug 'davidoc/taskpaper.vim', { 'for': 'taskpaper' }
Plug 'ervandew/supertab'
Plug 'freitass/todo.txt-vim'
Plug 'itspriddle/vim-marked', { 'for': 'markdown' }
Plug 'justinmk/vim-sneak'
Plug 'maxbrunsfeld/vim-yankstack'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'
Plug 'vim-scripts/renamer.vim'
Plug 'yegappan/mru'
Plug 'ap/vim-buftabline'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'godlygeek/tabular', { 'on': 'Tabularize' }
Plug 'morhetz/gruvbox'
Plug 'mattly/vim-markdown-enhancements', { 'for': 'markdown' }
Plug 'scrooloose/syntastic', { 'for': [ 'markdown', 'python', 'vim', 'yaml' ] }
call plug#end()
" }}}
" Filetypes {{{
" Unix & Mac Filetypes only
set ffs=unix,mac
" Use utf-8, no BOM
set encoding=utf-8 nobomb
scriptencoding utf-8
" Detect filetypes
filetype indent plugin on
" If a file is changed externally, reload it
set autoread
" *.md files are Markdown
autocmd vimrc BufNewFile,BufReadPost *.md set filetype=markdown
" All files in the Notes and Tumblr directories  are Markdown
autocmd vimrc BufRead,BufNewfile ~/Dropbox/Notes/* set filetype=markdown
autocmd vimrc BufRead,BufNewfile ~/.local/share/tumblr/* set filetype=markdown
" All txt files in the Todo.txt directory are Todo.txt format
autocmd vimrc BufRead,BufNewfile ~/Dropbox/todo/*.txt set filetype=todo
" All files in the Taskpaper directory are Taskpaper
autocmd vimrc BufRead,BufNewfile ~/Dropbox/Taskpaper/* set filetype=taskpaper
" Fold ~/.vim/vimrc
autocmd vimrc BufRead,BufNewfile ~/.vim/vimrc set foldmethod=marker
" Set text width to 65 when writing mail in mutt
autocmd vimrc FileType mail set tw=65
" Apply Syntastic settings to relevant filetypes
autocmd vimrc FileType markdown,python,vim,yaml set statusline+=%#warningmsg# |set statusline+=\ %{SyntasticStatuslineFlag()} |set statusline+=%* |let g:syntastic_always_populate_loc_list = 1 |let g:syntastic_auto_loc_list = 1| let g:syntastic_check_on_open = 1| let g:syntastic_check_on_wq = 0
" }}}
" User Interface {{{
" Use comma instead of backslash as leader
let g:mapleader=','
let g:gmapleader=','
let maplocalleader=','
" Hide buffers
set hidden
" Show line numbers
set number
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
" List and switch between buffers with ,l
nnoremap <leader>l :ls <CR>:b<space>
" Switch buffers with PageUp/PageDown (fn + up/down arrows on the Mac)
nnoremap <PageUp> :bprevious<CR>
nnoremap <PageDown> :bnext<CR>
" Enable mouse support (heresy!)
set mouse=a
" Don't show the mode
set noshowmode
" Show incomplete commands 
set showcmd
" Remember plenty of past commands
set history=1000
" Improve tab command completion
set wildmode=full
set wildmenu
" Ignore DS_Store files
set wildignore+=.DS_Store
" Ignore archives
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz
" Ignore temp and backup files
set wildignore+=*.swp,*~,._*
" Find files in the current directory, current *working* directory and below
set path=**
" Tell find, gf which filetypes to look for
set suffixesadd+=.markdown,.md,.py,.txt,.sh,.rb,.js,.c,.h,.go,.html,.css
" Speed up redrawing in some terminals
set ttyfast
" Speed up pause when entering/leaving insert mode
set ttimeoutlen=10
" Always show a menu when completing in insert mode
set completeopt+=menuone
" Colourscheme settings
" On a TTY, use the miro8 colourscheme (see http://1tw.org/1deUzmR). If 256
" colours are available, use Gruvbox.
set term=$TERM
if &term ==? 'linux'
    colorscheme miro8
else
    set t_Co=256
    set background=dark
    colorscheme gruvbox
    " Make the sign column match the background
    let g:gruvbox_sign_column='dark0'
    " Reduce contrast
    let g:gruvbox_contrast_dark='soft'
    " Don't invert colours when selecting text
    let g:gruvbox_invert_selection='0'
endif
" Macvim settings
if has('gui_running')
" Use 10pt Monaco in MacVim
    set guifont=Monaco:h12
" Remove the hideous toolbar in MacVim
    set guioptions=-t
" Use text dialogs instead of GUI popups
    set guioptions+=c
endif
" MRU settings
let MRU_Max_Entries = 30
nmap <leader>m :Mru<CR>
" Markdown folding
let g:markdown_fold_style = 'nested'
" Open Buffergator at the top
let g:buffergator_viewport_split_policy = 'T'
" }}}
" Text Editing & Formatting {{{
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
autocmd vimrc BufWinLeave *.* mkview
autocmd vimrc BufWinEnter *.* silent loadview
" Convert inline Markdown links to references with formd, and vice versa
nmap <leader>fr :%! ~/bin/formd -r<CR>
nmap <leader>fi :%! ~/bin/formd -i<CR>
" Ask before closing unsaved files, &c.
set confirm
" }}}
" Copy & Paste {{{
" Manage the clipboard with Yankstack
" (Required or the remapping of 'Y' below won't work)
call yankstack#setup()
" Cycle through Yankstack's clipboard history
nmap <leader>p <Plug>yankstack_substitute_older_paste
nmap <leader>P <Plug>yankstack_substitute_newer_paste
" Show yanks
nmap <leader>y :Yanks<CR>
" Yank to the end of the line with Y
map Y y$
" Integrate with the system clipboard
set clipboard=unnamed
" Toggle paste mode with F6
set pastetoggle=<F6>
" Always exit paste mode when leaving insert mode
autocmd vimrc InsertLeave * set nopaste
" }}}
" Search & Highlighting {{{
" Use matchit
runtime macros/matchit.vim
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
" Search and move with Sneak
nmap s <Plug>(SneakStreak)
nmap S <Plug>(SneakStreakBackward)
xmap s <Plug>Sneak_s
xmap S <Plug>Sneak_S
" Enable syntax highlighting
syntax on
" Highlight matching brackets
set showmatch
" }}}
" Spelling & Dictionary {{{
" Set dictionary
set dictionary=/usr/share/dict/words
" Turn on spellcheck with F4
map <F4> :setlocal spell spelllang=en_gb<CR>
" Turn off spellcheck with F5
map <F5> :set nospell<CR>
" Turn dictionary autocomplete on...
map <F7> :set complete+=k<CR>
" ... and off
map <S-F7> :set complete-=k<CR>
" }}}
" Backups & Undo {{{
" No ~backup files
set nobackup
" Make temporary backups
set writebackup
set backupdir=~/.vim/backup
set directory=~/.vim/temp
" Keep undo history
set undofile
set undodir=~/.vim/undo
" }}}
" Statusline {{{
" Define default mode status/StatusLine colours
" highlight User1 ctermbg=Black ctermfg=DarkGreen guibg=#073642 guifg=#859900
" highlight User2 ctermbg=Black ctermfg=DarkGray guibg=#002b36 guifg=#657b83
" highlight User3 ctermbg=Black ctermfg=DarkGreen guibg=#073642 guifg=#859900
" highlight User4 ctermbg=Black ctermfg=Red guibg=#073642 guifg=#dc322f
" Override Solarized colours to make the StatusLine and WildMenu prettier
" highlight! StatusLine ctermbg=DarkGreen ctermfg=Black guibg=#859900 guifg=#002b36
" highlight! WildMenu ctermbg=Black ctermfg=DarkGreen guibg=#002b36 guifg=#859900
" highlight! Search ctermfg=DarkGray guifg=#93a1a1
" highlight! IncSearch ctermfg=DarkGray guifg=#93a1a1
set statusline=
set statusline+=%3*
set statusline+=%<
set statusline+=%1*\ 
set statusline+=%{ModeStatus()}
set statusline+=%{PasteStatus()}
set statusline+=%2*
set statusline+=\ %F
set statusline+=%4*
set statusline+=%{FileStatus()}\ 
set statusline+=%3*
set statusline+=%{&filetype}\ 
set statusline+=%{&fileformat}\ 
set statusline+=%{&fileencoding}
set statusline+=%=\  
set statusline+=%{GitBranchStatus()}
set statusline+=%3*
set statusline+=\ %c\ %l/%L
" Git branch indicator
function! GitBranchStatus()
  if exists('*fugitive#head')
    let _ = fugitive#head()
    return strlen(_) ? ''._ : ''
  endif
  return ''
endfunction
" File status indicator
function! FileStatus()
  if &filetype ==# 'help'
    return ''
  elseif &readonly
    return ' ro'
  elseif &modified
    return ' m'
  else
    return ''
  endif
endfunction
" Colourful mode indicator
" Borrowed from http://1tw.org/Rh96Is
function! ModeStatus()
    redraw
    let l:mode = mode()
    if     mode ==# 'n'  | exec 'hi User1 ctermbg=Black ctermfg=DarkGreen guibg=#32302f guifg=#eee8d5' | return ' '
    elseif mode ==# 'i'  | exec 'hi User1 ctermbg=DarkGreen ctermfg=White guibg=#859900 guifg=#eee8d5' | return 'INSERT '
    elseif mode ==# 'v'  | exec 'hi User1 ctermbg=DarkMagenta ctermfg=White guibg=#d33682 guifg=#eee8d5' | return 'VISUAL '
    elseif mode ==# 'V'  | exec 'hi User1 ctermbg=DarkMagenta ctermfg=White guibg=#d33682 guifg=#eee8d5' | return 'V-LINE '
    elseif mode ==# '' | exec 'hi User1 ctermbg=DarkMagenta ctermfg=White guibg=#d33682 guifg=#eee8d5' | return 'V-BLOCK '
    elseif mode ==# 'R'  | exec 'hi User1 ctermbg=DarkCyan ctermfg=White guibg=#2aa198 guifg=#eee8d5' | return 'REPLACE '
    else                 | return l:mode
    endif
endfunction
" Paste mode indicator
function! PasteStatus()
    if &paste
        return '[PASTE] '
    en
        return ''
endfunction
" }}}
