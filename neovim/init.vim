
call plug#begin()
"source ~/.config/nvim/plugged/fzf-floating.vim

" Aesthetics - Main
Plug 'dracula/vim', { 'commit': '147f389f4275cec4ef43ebc25e2011c57b45cc00' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
Plug 'junegunn/rainbow_parentheses.vim'
" Aethetics - Additional
Plug 'nightsense/nemo'
Plug 'yuttie/hydrangea-vim'

" Functionalities
Plug 'tpope/vim-surround'
Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"Plug 'zchee/deoplete-jedi'
Plug 'ervandew/supertab'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/vim-easy-align'
Plug 'alvan/vim-closetag'
Plug 'tpope/vim-abolish'
Plug 'Yggdroot/indentLine'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'sheerun/vim-polyglot'
Plug 'chrisbra/Colorizer'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'metakirby5/codi.vim'
Plug 'dkarter/bullets.vim'
"Plug 'kdheepak/lazygit.vim', { 'branch': 'nvim-v1.4.3'}
Plug 'kdheepak/lazygit.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Vim practise
Plug 'ThePrimeagen/vim-be-good'
" Entertainment
"Plug 'ryanss/vim-hackernews'

call plug#end()
""" Python3 VirtualEnv
let g:python3_host_prog =  '~/.config/nvim/env/bin/python'

""" Coloring
syntax on
color dracula
highlight Pmenu guibg=white guifg=black gui=bold
highlight Comment gui=bold
highlight Normal gui=none
highlight NonText guibg=none

" Opaque Background (Comment out to use terminal's profile)
set termguicolors

" Transparent Background (For i3 and compton)
highlight Normal guibg=NONE ctermbg=NONE
highlight LineNr guibg=NONE ctermbg=NONE

""" Other Configurations
filetype plugin indent on
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab smarttab autoindent
set incsearch ignorecase smartcase hlsearch
set ruler laststatus=2 showcmd showmode
set list listchars=trail:»,tab:»-
set fillchars+=vert:\ 
set wrap breakindent
set encoding=utf-8
set number
set title
set relativenumber
set nu rnu
""" Plugin Configurations

" NERDTree
let NERDTreeShowHidden=1
let g:NERDTreeDirArrowExpandable = '↠'
let g:NERDTreeDirArrowCollapsible = '↡'

" Airline
let g:airline_powerline_fonts = 1
let g:airline_section_z = ' %{strftime("%-I:%M %p")}'
let g:airline_section_warning = ''
"let g:airline#extensions#tabline#enabled = 1

" Neovim :Terminal
tmap <Esc> <C-\><C-n>
tnoremap <A-h> <C-\><C-N><C-w>h
tnoremap <A-j> <C-\><C-N><C-w>j
tnoremap <A-k> <C-\><C-N><C-w>k
tnoremap <A-l> <C-\><C-N><C-w>l
"tmap <C-w> <Esc><C-w>
tmap <C-d> <Esc>:q<CR>
autocmd BufWinEnter,WinEnter term://* startinsert
autocmd BufLeave term://* stopinsert

set completeopt-=preview

" Supertab
let g:SuperTabDefaultCompletionType = "<C-n>"

" Ultisnips
let g:UltiSnipsExpandTrigger="<C-space>"
"let g:UltiSnipsJumpForwardTrigger="<Tab>"
let g:UltiSnipsJumpBackwardTrigger="<C-x>"
" Completion trigger with tab
inoremap <Tab> <C-y>
" EasyAlign
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
" indentLine
let g:indentLine_char = '▏'
let g:indentLine_color_gui = '#363949'

" TagBar
let g:tagbar_width = 30
let g:tagbar_iconchars = ['↠', '↡']

" fzf-vim
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit' }
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'Type'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Character'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

""" Filetype-Specific Configurations

" HTML, XML, Jinja
autocmd FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType css setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType xml setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType htmldjango setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType htmldjango inoremap {{ {{  }}<left><left><left>
autocmd FileType htmldjango inoremap {% {%  %}<left><left><left>
autocmd FileType htmldjango inoremap {# {#  #}<left><left><left>

" Markdown and Journal
autocmd FileType markdown setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType journal setlocal shiftwidth=2 tabstop=2 softtabstop=2

""" Custom Functions

" Dracula Mode (Dark)
function! ColorDracula()
    let g:airline_theme=''
    color dracula
    IndentLinesEnable
endfunction


" Zazen Mode (Black & White)
function! ColorZazen()
    let g:airline_theme='badcat'
    color zazen
    IndentLinesEnable
endfunction

"" Custom Mappings
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

let mapleader=" "

"" "NERDTree keymap
nmap <leader>q :NERDTreeToggle<CR>
nmap \ :NERDTreeToggle<CR>
nnoremap <silent> <leader>pv :NERDTreeFind<CR>

"" Color keymap
nmap <leader>w :TagbarToggle<CR>
nmap <leader>ee :Colors<CR>
nmap <leader>ea :AirlineTheme<CR>
nmap <leader>e1 :call ColorDracula()<CR>
nmap <leader>e2 :call ColorSeoul256()<CR>
nmap <leader>e3 :call ColorForgotten()<CR>
nmap <leader>e4 :call ColorZazen()<CR>

"" Reload nivm
nmap <leader>r :source ~/.config/nvim/init.vim<CR>

"" Unknown yet??
"nmap <leader>t :call TrimWhitespace()<CR>
"nnoremap <leader>w <c-w>
"inoremap <leader>w <c-w>
"inoremap <Esc><C-w> <C-w>
"imap <C-f> <C-W>
"nnoremap <C-w> <Nop>
""" Easy align ( NOT USE )
xmap <leader>a gaip*
nmap <leader>a gaip*

"" Resize vim window:
nmap <leader>+ :vertical res+15<CR>
nmap <leader>- :vertical res-10<CR>

""" Copy/paste
"noremap <leader>y "*y
"noremap <leader>p "*p
noremap <leader>y "+y
noremap <leader>p "+p

""" Toggle terminal ( split/new window )
nmap <leader>s <C-w>s<C-w>j:terminal<CR>
nmap <leader>vs <C-w>v<C-w>l:terminal<CR>

""" Floating terminal window
nmap <leader>tt :call FloatingTerm()<CR>
nmap <leader>d <Plug>(pydocstring)

" Move between vim windows with leader
nmap <leader>h :wincmd h<CR>
nmap <leader>j :wincmd j<CR>
nmap <leader>k :wincmd k<CR>
nmap <leader>l :wincmd l<CR>
nmap <leader>q :wincmd q<CR>

" In insert or command mode, move normally by using Ctrl
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>

" Insert new line in Insert modeline
imap <S-Enter> <Esc>o

"nnoremap <C-a> <C-w>w
""" Ignore last search highlight
nmap <silent> <leader><leader> :noh<CR>

""" Cursor next
"nmap <Tab> :bnext<CR>

""" Cursor prev
nmap <S-Tab> :bprevious<CR>
autocmd FileType python nmap <leader>x :0,$!~/.config/nvim/env/bin/python -m yapf<CR>

" Search files(fzf)/words(Rg)
nnoremap <C-f> :Rg<Cr>
nnoremap <C-p> :FZF<Cr>

" Enable float window
if has('nvim-0.4.0')
   Plug 'ncm2/float-preview.nvim'
endif

" LAZYGIT {{{
function! ToggleLazyGit()
	echo "Loaded Lazygit"
	call ToggleTerm('lazygit')
endfunction
"nnoremap <silent> <leader>gg :LazyGit<CR>
nnoremap <silent> <leader>gg :call ToggleLazyGit()<CR>

" coc config
nmap <silent> <leader>jd <Plug>(coc-definition)
nmap <silent> <leader>jy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
autocmd FileType js,ts,cpp,cxx,h,hpp,c :call GoCoc()
let g:coc_global_extensions = [
 \ 'coc-snippets',
  \ 'coc-pairs',
 \ 'coc-tsserver',
\ 'coc-eslint',
\ 'coc-prettier',
\ 'coc-json',
\ ]

"source ~/.config/nvim/plugged/fzf-floating.vim
