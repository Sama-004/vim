syntax on

set noerrorbells
set nowrap
set cindent
"set autoindent
"set smartindent noexpandtab tabstop=4 shiftwidth=4
set smartcase
" Remap 'kj' to Escape in insert mode
inoremap kj <Esc>
inoremap jk <Esc>
inoremap ( ()<Left>
inoremap { {}<Left>
inoremap [ []<Left>
set clipboard=unnamedplus
"colorscheme desert
colorscheme monokai
call plug#begin('~/.vim/plugged')
" Auto-format on :w
augroup AutoFormat
    autocmd!
    autocmd BufWritePre * silent! execute 'normal! ggVG='
augroup END

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

call plug#end()

let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsJumpForwardTriggeri="<c-b>"
let g:UltiSnipsJumpBackwardTriggeri="<c-z>"
set hlsearch
set incsearch
set bg=dark
set number relativenumber
set clipboard=unnamedplus
highlight ColorColumn ctermbg=4

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set fileformat=unix
set nocompatible
set smartindent
" Set up make file integration
" Use :copen to view makefile output and :cclose to close

"autocmd BufnewFile *.cpp -r ~/Desktop/Code/CP/snippets/basic_template.cpp

noremap <F2> <ESC> :w <CR> :!cat > in <CR>
autocmd filetype cpp noremap <F8> <ESC> :w <CR> :!g++ -std=c++20 -Wall -DLOCAL -O2 -o %< % && ./%< <CR>
"autocmd filetype cpp nnoremap <F9> :w <bar> Make <CR>
autocmd filetype cpp nnoremap <F9> :w <bar> !build.sh %:r <CR>
autocmd filetype cpp nnoremap <F10> :vertical terminal ++shell ++cols=40 ./%:r<CR>
autocmd filetype cpp nnoremap <F11> :!./%:r<CR>
autocmd filetype cpp nnoremap <F7> <ESC> :w <CR> :!pbcopy < % <CR>
"autocmd filetype cpp nnoremap <F9> :w <bar> Make <CR>
autocmd filetype cpp nnoremap <F9> :w <bar> !build.sh %:r <CR>
autocmd filetype cpp nnoremap <F10> :vertical terminal ++shell ++cols=40 ./%:r<CR>
autocmd filetype cpp nnoremap <F11> :!./%:r<CR>
" Enable man page plugin, do :Man <i> <func>
runtime ftplugin/man.vim

" Sets up highlighting for trailing whitespace
" These commands should be last because otherwise weird things happen
highlight ExtraWhitespace ctermbg=red  guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" When doing split and vsplit, automatically move the cursor to the new split
set splitright
set splitbelow
