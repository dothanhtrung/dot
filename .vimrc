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

""" Foot =======================
" Enable 24-bit colors
set termguicolors
let &t_8f = "\<Esc>[38:2::%lu:%lu:%lum"
let &t_8b = "\<Esc>[48:2::%lu:%lu:%lum"

" Enable native mouse support
set mouse=a
set ttymouse=sgr

" Workaround bug in vim, where it incorrectly thinks modifyOtherKeys level 2 is
" enabled, even when it's not. The snippets below ensure modifyOtherKeys=2 is
" enabled. https://github.com/vim/vim/issues/9014
let &t_TI = "\<Esc>[>4;2m"
let &t_TE = "\<Esc>[>4;m"
"=================================

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction

set listchars=tab:>—,trail:~,extends:>,precedes:<
set list

"autocmd vimenter * ++nested colorscheme gruvbox8_hard
colorscheme gruvbox8_hard

" Airline
let g:airline_theme='base16_gruvbox_dark_hard'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'


" Ale
set completeopt=menu,menuone,preview,noselect,noinsert
let g:ale_completion_enabled = 1
nnoremap <C-LeftMouse> :ALEGoToDefinition<CR>
nnoremap <C-b> :ALEGoToDefinition<CR>
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['eslint'],
\   'rust': ['rustfmt'],
\}
let g:ale_linters = {
\  'rust': ['analyzer'],
\}
nnoremap <C-d> :ALEGoToDefinition<CR>
nnoremap <S-F6> :ALERename<CR>
nnoremap <C-S-f> :ALESymbolSearch

" Rust
let g:rustfmt_autosave = 1

" Tagbar
nmap <F8> :TagbarToggle<CR>

" NERDTree
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
" Start NERDTree when Vim starts with a directory argument.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
    \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif

" buftabline
set hidden
nnoremap <C-N> :bnext<CR>
nnoremap <C-P> :bprev<CR>

" SHORTCUT
" nnoremap <C-A-Left> <C-o>
" nnoremap <C-A-Right> <C-i>
" nnoremap <A-1> :NERDTreeToggle<CR>

" Allow :w!! save file as root
cmap w!! w !sudo tee > /dev/null %


" Load all plugins now.
" Plugins need to be added to runtimepath before helptags can be generated.
packloadall
" Load all of the helptags now, after plugins have been loaded.
" All messages and errors will be ignored.
silent! helptags ALL
