" Vim-Plug
call plug#begin()
" THEME
Plug 'dracula/vim', { 'commit': '147f389f4275cec4ef43ebc25e2011c57b45cc00' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'sainnhe/gruvbox-material'

" Functionalities
Plug 'junegunn/vim-journal'
Plug 'junegunn/goyo.vim'
Plug 'tpope/vim-surround'
Plug 'majutsushi/tagbar'
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
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-eunuch'

Plug 'bounceme/remote-viewer'
Plug 'mbbill/undotree'
Plug 'justinmk/vim-dirvish'
Plug 'kdheepak/lazygit.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/incsearch-easymotion.vim'
Plug 'haya14busa/incsearch-fuzzy.vim'
Plug 'easymotion/vim-easymotion'
Plug 'aserebryakov/vim-todo-lists'
" Vim practise
Plug 'ThePrimeagen/vim-be-good'

" Go development
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries'}
"Plug 'govim/govim'
call plug#end()

let mapleader=" "
syntax enable

set termguicolors
set path+=**

source ~/.config/nvim/global-config.vim
source ~/.config/nvim/plugin-config.vim
source ~/.config/nvim/plugged/fzf-floating.vim
