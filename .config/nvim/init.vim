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
set dictionary+=$XDG_CONFIG_HOME/nvim/en_US.dict

" shortcuts
noremap <A-/> :buffers<CR>:buffer<space>
noremap <A-.> :bnext<CR>
noremap <A-,> :bprevious<CR>

vnoremap <C-c> "*y
vnoremap <C-x> "*d
inoremap <C-v> <C-r><C-o>*

noremap <C-s> :w<CR>
noremap <C-A-s> :w<space>
noremap <C-q> :q
