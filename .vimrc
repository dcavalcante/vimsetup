source ~/.vim/plug.vimrc
source ~/.vim/plug_setup.vimrc
source ~/.vim/text.vimrc
source ~/.vim/keymaps.vimrc
" source ~/.vim/functions.vimrc



" Obvious stuff
set history=700
set encoding=utf8 " Standard encoding
set ffs=unix,dos,mac " Standard filetype 

" Non-trivial
filetype indent plugin on " Enable filetype plugin
set nocompatible " ward off unexpected distro mess
set autoread " update when file is changed from outside
set showcmd " ?
set wildmenu " Suggestion 
set lazyredraw " For performance when using macros
set magic " For regex

" Previous editing
" Return to last edit position when opening files
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
" Remember info about open buffers on close
set viminfo^=%

" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()


" Turn off error sounds
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Better search
set incsearch " Move to match while typing
set hlsearch " highlight terms
set ignorecase


" Extra keycombos and fast access
let mapleader = ","
let g:mapleader = ","
nmap <leader>w :w!<cr> " fast save

" :W sudo saves the file 
" (useful for handling the permission-denied error)
" command W w !sudo tee % > /dev/null

" Tabs stuff
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove

" User Interface
set hid " Buffer is hidden when abbandoned
set showmatch " highlight matching [{()}]
set mat=2 " Tenths of seconds to blink when matching brackets

" Color settings
syntax enable
set background=dark
colorscheme desert

" Make backspace act properly
set backspace=eol,start,indent 
set whichwrap+=<,>,h,l

" MacVim / GVim specifics
if has('gui_running')
	set guifont=Monaco:h14
	set guioptions-=T " Remove toolbar completely
	set guioptions+=e
	set t_Co=256
	set guitablabel=%M\ %t
endif

" Command bar
set cmdheight=2

" Status line
set laststatus=2
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l



" Helper functions

function! VisualSelection(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    en
    return ''
endfunction
