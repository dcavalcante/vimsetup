" Install vim-plug if we don't already have it
if empty(glob("~/.vim/autoload/plug.vim"))
    " Ensure all needed directories exist  (Thanks @kapadiamush)
    execute 'mkdir -p ~/.vim/plugged'
    execute 'mkdir -p ~/.vim/autoload'
    " Download the actual plugin manager
    execute '!curl -fLo ~/.vim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim'
endif

call plug#begin('~/.vim/plugged')

" Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}

" Colorschemes
Plug 'captbaritone/molokai'
Plug 'chriskempson/vim-tomorrow-theme'
Plug 'altercation/vim-colors-solarized'
Plug 'fxn/vim-monochrome'
Plug 'chriskempson/base16-vim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'tyrannicaltoucan/vim-deep-space'
Plug 'rakr/vim-one'
Plug 'juanedi/predawn.vim'

" Color pack
Plug 'flazz/vim-colorschemes'

" Preview installed colorschemes
Plug 'vim-scripts/ScrollColors'

" Air tight statusbar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Make tab handle all completions
" Plug 'ervandew/supertab'
" Syntastic: Code linting errors
Plug 'scrooloose/syntastic', { 'for': ['php', 'python', 'javascript', 'css'] }
" Make commenting easier
" Plug 'tpope/vim-commentary'
" Plug 'scrooloose/nerdcommenter'
" Change brackets and quotes
Plug 'tpope/vim-surround'
" Make vim-surround repeatable with .
Plug 'tpope/vim-repeat'
" Search throughtout project
Plug 'rking/ag.vim'
" Search files in project
Plug 'kien/ctrlp.vim'
" Git within Vim
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Javascript indentation and syntax
Plug 'pangloss/vim-javascript'
" Better RoR
Plug 'tpope/vim-rails'

Plug 'terryma/vim-multiple-cursors'

call plug#end()
