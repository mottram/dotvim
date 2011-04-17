call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
set term=$TERM
if &term == "linux"
    colorscheme miro8
else
    set t_Co=256
    colorscheme macvim
endif
set hidden
set number
set autoindent
set smartindent
set confirm
set history=1000
set incsearch
set hlsearch
set ignorecase
set smartcase
set laststatus=2
set mouse=a
set showcmd
set ruler
set nobackup
set writebackup
set backupdir=~/.vim/backup
set directory=~/.vim/temp
set wildmenu
set wildignore+=.DS_Store
set nomodeline
set tabpagemax=20
set showtabline=2
set showmatch	
set ffs=unix,mac
set guifont=Monaco:h12
set tabstop=4
set shiftwidth=4
set softtabstop=4
set smarttab
set expandtab
set pastetoggle=<F6>
set dictionary=/usr/share/dict/words
set clipboard=unnamed
syntax on
filetype indent plugin on
imap jj <Esc>
map Y y$
map ,t :tabnew<CR>
map ,n :tabnext<CR>	
map ,jl :JekyllLink<CR> 
map ,jp :JekyllPost<CR> 
map ,ji :JekyllPic<CR> 
map ,jc :JekyllCommit<CR>
map ,f :FufFile<CR>
map ,b :FufBuffer<CR>
map <F2> :NERDTreeToggle<CR>
map <F3> :r !pbpaste<CR>
map <F4> :setlocal spell spelllang=en_gb<CR>
map <F5> :set nospell<CR>
au BufWinLeave *.html,*.css mkview	
au BufWinEnter *.html,*.css silent loadview	
au FileType mail set tw=65
map <F7> :set complete+=k<CR>
map <S-F7> :set complete=-k<CR>
map <F8> :YRShow<CR>
let g:jekyll_path = "~/mottram"
let g:yankring_history_dir='$HOME/.yr/'
let g:yankring_clipboard_monitor=1
autocmd BufRead,BufNewfile ~/notes/* set filetype=markdown

if has('statusline')
  set statusline=%<%f\ 
  set statusline+=%w%h%m%r 
  set statusline+=%{fugitive#statusline()}
  set statusline+=\ [%{&ff}/%Y]  
  set statusline+=\ [%{getcwd()}]
  set statusline+=%=%-14.(Line:\ %l\ of\ %L\ [%p%%]\ -\ Col:\ %c%V%)
endif

" Old statusline
" set statusline=%-(%F%m%r%h%w%)\ %{&ff}/%Y/%{&encoding}\ %=%(@\%03.3b\ %Ll\ %l,%v\ (%p%%)%) 
