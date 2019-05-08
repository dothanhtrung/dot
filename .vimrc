" color koehler

let base16colorspace=256 " Access colors present in 256 colorspace
"colorscheme base16-default
set background=dark

set nu

" Enable filetype plugins
" filetype plugin on
" filetype indent on
"
" Turn backup off
set nobackup
set nowb
set noswapfile

" Highlight search results
set hlsearch

" Enable syntax highlighting
syntax enable
"
" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Don't redraw while executing macros (good performance config)
set lazyredraw

" Always show statusline
set laststatus=2

" Use 256 colours (Use this setting only if your terminal supports 256
" colours)
set t_Co=256
