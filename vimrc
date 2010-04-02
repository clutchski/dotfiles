"
" behaviour
"

set backspace=indent,eol,start
set wildmenu " command line tab completion
abbrev RE <c-r>=(getcmdtype()==':' && getcmdpos()==1 ? 'e **' : 'RE')<CR>

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
endif
