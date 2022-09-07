set background=dark

set nu

" Enable filetype plugins
filetype plugin indent on

" Turn backup off
set nobackup
set nowb
set noswapfile

" Highlight search results
set hlsearch
"hi Search ctermbg=LightYellow
"hi Search ctermfg=Red

" Enable syntax highlighting
syntax enable
"
" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Don't redraw while executing macros (good performance config)
" set lazyredraw

" Always show statusline
set laststatus=2

" Use 256 colours (Use this setting only if your terminal supports 256
" colours)
set t_Co=256

" Fix vim paste mode
let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction

set listchars=eol:¬,tab:>—,trail:~,extends:>,precedes:<,space:·
set list

autocmd vimenter * ++nested colorscheme gruvbox8_hard

" Airline
let g:airline_theme='base16_gruvbox_dark_hard'

" Ale
set completeopt=menu,menuone,preview,noselect,noinsert
let g:ale_completion_enabled = 1
nnoremap <C-LeftMouse> :ALEGoToDefinition<CR>
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['eslint'],
\   'rust': ['rustfmt'],
\}
let g:ale_linters = {
\  'rust': ['analyzer'],
\}

" Rust
let g:rustfmt_autosave = 1
