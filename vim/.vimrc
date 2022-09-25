set spell spelllang=en_gb
set number
set wrap
set linebreak
syntax on

set background=dark
set t_Co=256

autocmd BufNewFile,BufRead * let $SNIPSUBDIR = &filetype
