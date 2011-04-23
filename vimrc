
"
" behaviour
"

set backspace=indent,eol,start
set history=1000         " remember more commands and search history
set nobackup
set noerrorbells         " don't beep
set pastetoggle=<F2>
set undolevels=1000      
set wildignore=*.swp,*.bak,*.pyc,*.class
set wildmenu             " command line tab completion
set tags=tags;/          " look up directory tree for tags file

cmap w!! w !sudo tee % >/dev/null
abbrev RE <c-r>=(getcmdtype()==':' && getcmdpos()==1 ? 'e **' : 'RE')<CR>

nnoremap ; :
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

nnoremap j gj
nnoremap k gk

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
    autocmd FileType javascript  set ts=2 sw=2 cindent et
    autocmd FileType docbk,html,xhtml,xml,css set ts=2 sw=2
    autocmd FileType less set ts=2 sw=2
    autocmd FileType yaml set ts=2 sw=2
    autocmd FileType scss set ts=2 sw=2
    autocmd FileType haml set ts=2 sw=2
endif
