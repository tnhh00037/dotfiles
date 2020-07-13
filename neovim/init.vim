" Vim-Plug
call plug#begin()
" THEME
Plug 'dracula/vim', { 'commit': '147f389f4275cec4ef43ebc25e2011c57b45cc00' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
Plug 'junegunn/rainbow_parentheses.vim'

" Functionalities
Plug 'junegunn/vim-journal'
Plug 'junegunn/goyo.vim'
Plug 'tpope/vim-surround'
Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'ervandew/supertab'
Plug 'jiangmiao/auto-pairs'
Plug 'alvan/vim-closetag'
Plug 'tpope/vim-abolish'
Plug 'Yggdroot/indentLine'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'sheerun/vim-polyglot'
Plug 'chrisbra/Colorizer'
Plug 'morhetz/gruvbox'
"Plug 'SirVer/ultisnips'
"Plug 'honza/vim-snippets'
Plug 'kdheepak/lazygit.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/incsearch-easymotion.vim'
Plug 'haya14busa/incsearch-fuzzy.vim'
Plug 'easymotion/vim-easymotion'
Plug 'aserebryakov/vim-todo-lists'
" Vim practise
Plug 'ThePrimeagen/vim-be-good'
call plug#end()

let mapleader=" "
syntax enable

set termguicolors

source ~/.config/nvim/global-config.vim
source ~/.config/nvim/plugin-config.vim
source ~/.config/nvim/plugged/fzf-floating.vim
