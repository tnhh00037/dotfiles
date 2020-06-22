color gruvbox

""" Stop auto comment next line
set formatoptions-=cro

""" Python3 VirtualEnv
let g:python3_host_prog = '~/.config/nvim/env/bin/python3'
let g:python_host_prog = '~/.config/nvim/env/bin/python'

""" Node path
let g:coc_node_path='~/.nvm/versions/node/v12.13.1/bin/node'

" Coloring
syntax on
highlight Pmenu guibg=#80d6ff guifg=black gui=bold
highlight PmenuSel guibg=#8aacc8 guifg=black gui=bold
highlight Comment gui=bold
highlight Normal gui=none guibg=NONE ctermbg=NONE
highlight NonText guibg=none
let t:is_transparent = 1

"" Color keymap
nmap <leader>w :TagbarToggle<CR>
nmap <leader>ee :Colors<CR>
nmap <leader>ea :AirlineTheme<CR>
nmap <leader>e1 :call GruvBox()<CR>
nmap <leader>e2 :call ColorDracula()<CR>

" Opaque Background (Comment out to use terminal's profile)
set termguicolors

" Code format configuration
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
let g:indentLine_char = '▏'
let g:indentLine_color_gui = '#363949'

" Enable float window
if has('nvim-0.4.0')
   Plug 'ncm2/float-preview.nvim'
endif

""" Terminal
tmap <Esc> <C-\><C-n>
tmap <C-d> <Esc>:q<CR>
tnoremap <A-h> <C-\><C-N><C-w>h
tnoremap <A-j> <C-\><C-N><C-w>j
tnoremap <A-k> <C-\><C-N><C-w>k
tnoremap <A-l> <C-\><C-N><C-w>l
tmap <C-d> <Esc>:q<CR>
autocmd BufWinEnter,WinEnter term://* startinsert
autocmd BufLeave term://* stopinsert
set completeopt-=preview

" Move in insert mode ( for moving between suggestions )
inoremap <C-j> <Down>
inoremap <C-k> <Up>

" Move code up-down with Alt
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" Move between vim windows with leader
nmap <leader>h :wincmd h<CR>
nmap <leader>j :wincmd j<CR>
nmap <leader>k :wincmd k<CR>
nmap <leader>l :wincmd l<CR>
nmap <leader>q :wincmd q<CR>

" Markdown and Journal
autocmd FileType markdown setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType journal setlocal shiftwidth=2 tabstop=2 softtabstop=2

""" Ignore last search highlight
nmap <silent> <leader><leader> :noh<CR>

""" Cursor next
nmap <Tab> :bnext<CR>
""" Cursor prev
nmap <S-Tab> :bprevious<CR>
" Unknown?? 
autocmd FileType python nmap <leader>x :0,$!~/.config/nvim/env/bin/python -m yapf<CR>

" Code folding
set foldmethod=syntax
set foldlevelstart=1
let javaScript_fold=1         " JavaScript
let perl_fold=1               " Perl
let php_folding=1             " PHP
let r_syntax_folding=1        " R
let ruby_fold=1               " Ruby
let sh_fold_enabled=1         " sh
let vimsyn_folding='af'       " Vim script
let xml_syntax_folding=1      " XML
autocmd FileType * exe "normal zR"

""" Copy/paste with main clipboard
noremap <leader>y "+y
noremap <leader>p "+p
noremap <leader>d "+d

"" Set mark across the files
nmap <silent> mj mJ
nmap <silent> mk mK
nmap <silent> 'j 'J
nmap <silent> 'k 'K

""" Toggle terminal ( split/new window )
nmap <leader>s <C-w>s<C-w>j:terminal<CR>
nmap <leader>vs <C-w>v<C-w>l:terminal<CR>

""" Floating terminal window
nmap <leader>tt :call FloatingTerm()<CR>

""" Easy Align
xmap <leader>a gaip*
nmap <leader>a gaip*

"" Resize vim window:
nmap <leader>+ :vertical res+15<CR>
nmap <leader>- :vertical res-10<CR>
nmap <leader>r :source ~/.config/nvim/init.vim<CR>

"let g:coc_global_extensions = [
 " \ 'coc-snippets',
"  \ 'coc-pairs',
 " \ 'coc-tsserver',
  "\ 'coc-prettier',
  "\ 'coc-json',
  "\ ]
" coc config
nmap <silent> <leader>jd <Plug>(coc-definition)
nmap <silent> <leader>jy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> <leader>gr <Plug>(coc-references)
autocmd FileType js,ts,cpp,cxx,h,hpp,c :call GoCoc()

"" Reload nivm
nmap <leader>r :source ~/.config/nvim/init.vim<CR>
