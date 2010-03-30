" tabs
set expandtab
set smarttab
set autoindent
set shiftwidth=4
set softtabstop=4

" width
set textwidth=79

" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

" command line tab completion
set wildmenu

" view options
colorscheme peachpuff
syntax on
set ruler
set number

" file type tab settings
if has("autocmd")
    autocmd FileType python set ts=4 sw=4 et
    autocmd FileType ruby   set ts=2 sw=2
    autocmd FileType c,cpp  set ts=4 sw=4 cindent
    autocmd FileType javascript  set ts=2 sw=2 cindent et
    autocmd FileType docbk,html,xhtml,xml,css set ts=2 sw=2
endif
