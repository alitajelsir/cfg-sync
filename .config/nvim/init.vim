" Enable mouse support in all modes 
set mouse=a


" Show Number column and decrease its width
set number numberwidth=1

" Set custom background and foreground for number column
highlight LineNr ctermbg=232 ctermfg=246


" Hide number column in terminal mode
autocmd TermOpen * setlocal nonumber

" Start with insert mode in terminal mode
autocmd TermOpen * startinsert


" Configure tab
set tabstop=2 shiftwidth=2


" Set dictionary path
set dictionary+=$XDG_DATA_HOME/nvim/en_US.dict


" Open file explorer
noremap <A--> :Explore<CR>

" Manage open files
noremap <A-/> :buffers<CR>:buffer<space>
noremap <A-.> :bnext<CR>
noremap <A-,> :bprevious<CR>

" Copy, cut and paste
vnoremap <C-c> "*y
vnoremap <C-x> "*d
inoremap <C-v> <C-r><C-o>*

" Save and quit
noremap <C-s> :write<CR>
noremap <C-q> :quit
