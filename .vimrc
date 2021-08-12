colorscheme vibrantink
set t_Co=256
cmap w!! %!sudo tee > /dev/null %
cmap p!! :set paste
cmap np!! :set nopaste
set autoindent
set cindent
set tabstop=2
set shiftwidth=2
set expandtab
set foldmethod=indent
set foldlevel=99
syntax on
filetype on
filetype plugin indent on
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h
set mouse=
set ttymouse=
"This unsets the "last search pattern" register by hitting return
nnoremap <silent> <CR> :nohlsearch <CR>
