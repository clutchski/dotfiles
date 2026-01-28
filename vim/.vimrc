"============
" Plugins
"============

" Set up vim-plug
call plug#begin('~/.vim/plugged')

Plug 'bling/vim-bufferline'
Plug 'mhinz/vim-startify'
Plug 'ntpeters/vim-better-whitespace'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'vim-scripts/SearchComplete'
Plug 'leafgarland/typescript-vim'
Plug 'gruvbox-community/gruvbox'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'rust-lang/rust.vim'

call plug#end()

" configure startify
let g:startify_skiplist = [
       \ '.*\.so',
       \ '.*\.rdb',
       \ '.*/\.git/*'
       \ ]
let g:startify_custom_header = [''] " disable header

" Don't try to autoinstall go by default
let g:go_disable_autoinstall = 1
let g:go_auto_type_info = 0
let g:go_fmt_command = "goimports"

let g:rustfmt_autosave = 1

" ctrlp config
let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let g:ctrlp_open_new_file = 'r'
let g:ctrlp_mruf_relative = 1
let g:ctrlp_reuse_window  = 'startify\|netrw'

"=============
" Behaviour
"=============

" Options.
set backspace=indent,eol,start
set history=1000            " remember more commands and search history
set noerrorbells            " don't beep
set pastetoggle=<F2>
set undolevels=1000
set wildmenu                " command line tab completion
set tags=tags;/             " look up directory tree for tags file
set backup                  " make backup files
set backupdir=~/.vim/backup " where to put backup files
set directory=~/.vim/tmp    " directory to place swap files in
set mouse=a                 " Enable the mouse.
set wildignore=*.sw*,*.bak,*.pyc,*.class,*.mako.py,*.o,*.egg,*.a
set modelines=5

" clean up netrw config
let g:netrw_browse_split=0
let g:netrw_liststyle=3
let g:netrw_banner=0
let g:netrw_list_hide='^\(\..\{-}\.sw.\|.\{-}\.pyc\)$' " FIXME: use wildignore??

" Reopen with sudo.
cmap w!! w !sudo tee % >/dev/null

" Disable the never used ex-mode & recording mode
map Q <Nop>
map q <Nop>

nnoremap ; :

nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>

" Don't open gnome help when trying to hit escape.
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

nnoremap j gj
nnoremap k gk

map - :Explore<cr>
set pastetoggle=<F2>

"================
" View
"================

let g:gruvbox_contrast_dark = 'hard'
autocmd vimenter * ++nested colorscheme gruvbox

syntax on
set ruler
set number

"====================
" formatting
"====================
set expandtab
set smarttab
set autoindent
set shiftwidth=4
set softtabstop=4
set textwidth=79

" file type tab settings
if has("autocmd")
    autocmd FileType python set ts=4 sw=4 et
    autocmd FileType ruby,eruby   set ts=2 sw=2
    autocmd FileType c,cpp  set ts=4 sw=4 cindent
    autocmd FileType javascript  set ts=4 sw=4 cindent et
    autocmd FileType docbk,html,xhtml,xml,css set ts=2 sw=2
    autocmd FileType less set ts=2 sw=2
    autocmd FileType yaml set ts=2 sw=2
    autocmd FileType scss set ts=2 sw=2
    autocmd FileType haml set ts=2 sw=2
    autocmd FileType haml set ts=2 sw=2
    autocmd FileType make,go set noexpandtab ts=8 sw=8
endif
