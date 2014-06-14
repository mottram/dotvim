" Jack Mottram's ~/.vimrc
" For more details see:
" https://github.com/mottram/dotvim
" TODO Use let: to define colours, use in ModeStatus function and StatusLine
" TODO Single letter replace mode indicator (r) should match replace mode (R)
" TODO I seem to be getting annoyed by relativenumber - toggle w/ keybinding?
" TODO Tumblr posting should be a script (convert shell aliases)
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
Plugin 'gmarik/vundle'
" Git wrangling
" https://github.com/tpope/vim-fugitive
Plugin 'tpope/vim-fugitive'
" Easy quoting/parenthesizing
" https://github.com/tpope/vim-surround
Plugin 'tpope/vim-surround'
" Repeat vim-surround stuff with '.'
" https://github.com/tpope/vim-repeat
Plugin 'tpope/vim-repeat'
" Visualise the undo tree
" https://github.com/sjl/gundo.vim
Plugin 'sjl/gundo.vim'
" Pretty colours
" https://github.com/altercation/vim-colors-solarized
Plugin 'altercation/vim-colors-solarized'
" Find files, open buffers, recently used, &c.
" https://github.com/kien/ctrlp.vim
Plugin 'kien/ctrlp.vim'
" Text filtering and alignment
" https://github.com/godlygeek/tabular
Plugin 'godlygeek/tabular'
" Outliner mode
" https://github.com/vimoutliner/vimoutliner
Plugin 'vimoutliner/vimoutliner'
" Shell command helper
" https://github.com/sjl/clam.vim
Plugin 'sjl/clam.vim'
" Use tab for completions
" https://github.com/ervandew/supertab
Plugin 'ervandew/supertab'
" Filesystem sidebar
" https://github.com/scrooloose/nerdtree
Plugin 'scrooloose/nerdtree'
" Make NERDTree work independently of tabs
" https://github.com/jistr/vim-nerdtree-tabs
Plugin 'jistr/vim-nerdtree-tabs'
" Taskpaper syntax highlighting
" https://github.com/davidoc/taskpaper.vim
Plugin 'davidoc/taskpaper.vim'
" Markdown syntax highlighting
" https://github.com/tpope/vim-markdown
Plugin 'tpope/vim-markdown'
" Preview Mardkown files in Marked
" https://github.com/itspriddle/vim-marked
Plugin 'itspriddle/vim-marked'
" Toggle comments
" https://github.com/tpope/vim-commentary
Plugin 'tpope/vim-commentary'
" Clipboard history
" https://github.com/maxbrunsfeld/vim-yankstack
Plugin 'maxbrunsfeld/vim-yankstack'
" Improved matching with %
" https://github.com/edsono/vim-matchit
Plugin 'edsono/vim-matchit'
" Shows a git diff in the gutter
" https://github.com/airblade/vim-gitgutter
Plugin 'airblade/vim-gitgutter'
" Rename files
" https://github.com/vim-scripts/renamer.vim
Plugin 'vim-scripts/renamer.vim'
" Snippets
" https://github.com/SirVer/ultisnips
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
" Todo.txt
" https://github.com/freitass/todo.txt-vim
Plugin 'freitass/todo.txt-vim'
" =============================================================================
" Filetypes
" =============================================================================
" Unix & Mac Filetypes only
set ffs=unix,mac
" Use utf-8, no BOM
set encoding=utf-8 nobomb
" Detect filetypes
filetype indent plugin on
" All files in the Notes and Tumblr directories  are Markdown
au BufRead,BufNewfile ~/Dropbox/Notes/* set filetype=markdown
au BufRead,BufNewfile ~/.local/share/tumblr/* set filetype=markdown
" All txt files in the Todo.txt directory are Todo.txt format
au BufRead,BufNewfile ~/Dropbox/todo/*.txt set filetype=todo
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
" set relativenumber
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
" Toggle the NERDTree sidebar with <F2>
map <F2> :NERDTreeTabsToggle<CR>
" Toggle Gundo's undo tree with <F3>
nnoremap <F3> :GundoToggle<CR>
" Open the CtrlP search pane with Control+X
let g:ctrlp_map = '<C-X>'
" Enable mouse support (heresy!)
set mouse=a
" Don't show the mode
set noshowmode
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
" Speed up pause when entering/leaving insert mode
set ttimeoutlen=40
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
" Trigger UltiSnips with Tab
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" =============================================================================
" Copy & Paste
" =============================================================================
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
" GitGutter colour settings
highlight clear SignColumn
highlight GitGutterAddLine ctermbg=LightGray
highlight GitGutterChangeLine ctermbg=LightGray
highlight GitGutterDeleteLine ctermbg=LightGray
highlight GitGutterChangeDeleteLine ctermbg=LightGray
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
map <S-F7> :set complete-=k<CR>
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
" Testing & Temporary
" =============================================================================
" Weblog posting
nmap <F11> :!~/bin/otw-draft.sh %<CR><CR>
nmap <S-F11> :!~/bin/otw-queue.sh %<CR><CR>
" New statusline, no plugins required.
" Define default mode status/StatusLine colours
highlight User1 ctermbg=Black ctermfg=DarkGreen guibg=#073642 guifg=#859900
highlight User2 ctermbg=Black ctermfg=DarkGray guibg=#002b36 guifg=#657b83
highlight User3 ctermbg=Black ctermfg=DarkGreen guibg=#073642 guifg=#859900
highlight User4 ctermbg=Black ctermfg=Red guibg=#073642 guifg=#dc322f
" Override Solarized colours to make the StatusLine and WildMenu prettier
highlight! StatusLine ctermbg=DarkGreen ctermfg=Black guibg=#859900 guifg=#002b36
highlight! WildMenu ctermbg=Black ctermfg=DarkGreen guibg=#002b36 guifg=#859900
highlight! Search ctermfg=DarkGray guifg=#93a1a1
highlight! IncSearch ctermfg=DarkGray guifg=#93a1a1
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
set statusline+=\ %l/%L\ 
" Git branch indicator
function! GitBranchStatus()
  if exists("*fugitive#head")
    let _ = fugitive#head()
    return strlen(_) ? ''._ : ''
  endif
  return ''
endfunction
" File status indicator
function! FileStatus()
  if &filetype == "help"
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
    if     mode ==# "n"  | exec 'hi User1 ctermbg=Black ctermfg=DarkGreen guibg=#002b36 guifg=#859900' | return " "
    elseif mode ==# "i"  | exec 'hi User1 ctermbg=DarkGreen ctermfg=LightGray guibg=#859900 guifg=#eee8d5' | return "INSERT "
    elseif mode ==# "v"  | exec 'hi User1 ctermbg=DarkMagenta ctermfg=LightGray guibg=#d33682 guifg=#eee8d5' | return "VISUAL "
    elseif mode ==# "V"  | exec 'hi User1 ctermbg=DarkMagenta ctermfg=LightGray guibg=#d33682 guifg=#eee8d5' | return "V-LINE "
    elseif mode ==# "" | exec 'hi User1 ctermbg=DarkMagenta ctermfg=LightGray guibg=#d33682 guifg=#eee8d5' | return "V-BLOCK "
    elseif mode ==# "R"  | exec 'hi User1 ctermbg=DarkCyan ctermfg=LightGray guibg=#2aa198 guifg=#eee8d5' | return "REPLACE "
    else                 | return l:mode
    endif
endfunction
" Paste mode indicator
function! PasteStatus()
    if &paste
        return "[PASTE] "
    en
        return ''
endfunction

" Convert vimoutliner forrmat to Markdown
function! Vomd()
  let lines = []
  let was_body = 0
  for line in getline(1,'$')
    if line =~ '^\t*[^:\t]'
      let indent_level = len(matchstr(line, '^\t*'))
      if was_body " <= remove this line to have body lines separated
        call add(lines, '')
      endif " <= remove this line to have body lines separated
      call add(lines, substitute(line, '^\(\t*\)\([^:\t].*\)', '\=repeat("#", indent_level + 1)." ".submatch(2)', ''))
      call add(lines, '')
      let was_body = 0
    else
      call add(lines, substitute(line, '^\t*: ', '', ''))
      let was_body = 1
    endif
  endfor
  silent %d _
  call setline(1, lines)
endfunction
function! Mdvo()
  let lines = []
  for line in getline(1,'$')
    if line =~ '^\s*$'
      continue
    endif
    if line =~ '^#\+'
      let indent_level = len(matchstr(line, '^#\+')) - 1
      call add(lines, substitute(line, '^#\(#*\) ', repeat("\<Tab>", indent_level), ''))
    else
      call add(lines, substitute(line, '^', repeat("\<Tab>", indent_level) . ': ', ''))
    endif
  endfor
  silent %d _
  call setline(1, lines)
endfunction
