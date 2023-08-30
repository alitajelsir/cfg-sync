" Mouse
set mouse=a

" Number column
set number numberwidth=1
highlight LineNr ctermbg=234 ctermfg=246

" Tab
set tabstop=2 shiftwidth=2

" Terminal
autocmd TermOpen * setlocal nonumber
autocmd TermOpen * startinsert

" Dictionary
set dictionary+=/usr/share/dict/words

" Shortcuts
noremap <A-/> :buffers<CR>:buffer<space>
noremap <A-.> :bnext<CR>
noremap <A-,> :bprevious<CR>

vnoremap <C-c> "+y
vnoremap <C-x> "+d
inoremap <C-v> <C-r><C-o>+

noremap <C-s> :w<CR>
noremap <C-q> :q

noremap <F7> :setlocal spell spelllang=en_us<CR>
noremap <F19> :setlocal nospell<CR>

" Cursor
:au VimLeave * set guicursor=a:ver25-blinkon0
