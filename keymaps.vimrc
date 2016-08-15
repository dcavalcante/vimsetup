" Extra keycombos and fast access
let mapleader = ","
let g:mapleader = ","

nmap <leader>w :w!<cr> " fast save
nnoremap <Leader>n :NERDTreeToggle<Enter>


" Key mapping
" map 0 ^ " Map 0 to first non-blank character

" Visual Mode 
" Map * or # for searching current selection
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>

"Normal mode
" Move a line using ALT+[jk] or Comamnd+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

if has("mac") || has("macunix")
  nmap <D-j> <M-j>
  nmap <D-k> <M-k>
  vmap <D-j> <M-j>
  vmap <D-k> <M-k>
endif

" Line numbering
" nnoremap <C-n> :call NumberToggle()<cr>

" Auto toggle rel/abs numbering when focus/blur
:au FocusLost * :set number
:au FocusGained * :set relativenumber

" Auto toggle rel/abs numbering when normal/insert mode
autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber
