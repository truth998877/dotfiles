set nospell
set spelllang=en_gb
set number
set linebreak
syntax on

set background=dark
set t_Co=256

set backspace=indent,eol,start


set noignorecase
set ruler
set ruf=%30(%=%#LineNr#%.50F\ [%{strlen(&ft)?&ft:'none'}]\ %l:%c\ %p%%%)
set tabstop=2
set softtabstop=2

set smartindent
set smarttab

set showmode

set nobackup
set noswapfile
set nowritebackup

set spc=

set hlsearch
set incsearch
set linebreak

set wrapscan
set nowrap

set ttyfast

filetype plugin on

au bufnewfile,bufRead *.txt set spell
au FileType markdown,pandoc noremap j gj
au FileType markdown,pandoc noremap k gk
au FileType markdown,text set spell

autocmd BufNewFile,BufRead * let $SNIPSUBDIR = &filetype
