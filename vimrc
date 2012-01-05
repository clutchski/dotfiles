"
" behaviour
"

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
set wildignore=*.swp,*.bak,*.pyc,*.class
set modelines=5

" Reopen with sudo.
cmap w!! w !sudo tee % >/dev/null

" Disable the never used ex-mode.
map Q <Nop>

" An easier to use leader key.
nnoremap ; :

" Don't open gnome help when trying to hit escape.
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

nnoremap j gj
nnoremap k gk

" Some tab shortcuts.
map <Leader>t :tabnew<cr>
map <Leader>w :tabprevious<cr>
map <Leader>e :tabnext<cr>

" Strip trailing whitespace
function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction

" Strip trailing whitespace on save.
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

"
" view
"
colorscheme peachpuff
syntax on
set ruler
set number


"
" formatting
"
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
    autocmd FileType make set noexpandtab ts=8 sw=8
endif
