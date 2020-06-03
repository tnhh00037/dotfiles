""" Optixal's Neovim Init.vim

""" Vim-Plug
call plug#begin()

" Aesthetics - Main
Plug 'dracula/vim', { 'commit': '147f389f4275cec4ef43ebc25e2011c57b45cc00' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/seoul256.vim'
Plug 'junegunn/vim-journal'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'nightsense/forgotten'
Plug 'zaki/zazen'

" Aethetics - Additional
Plug 'nightsense/nemo'
Plug 'yuttie/hydrangea-vim'
Plug 'chriskempson/tomorrow-theme', { 'rtp': 'vim' }
Plug 'rhysd/vim-color-spring-night'

" Functionalities
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
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
Plug 'heavenshell/vim-pydocstring'
Plug 'vim-scripts/loremipsum'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'metakirby5/codi.vim'
Plug 'dkarter/bullets.vim'

" Entertainment
"Plug 'ryanss/vim-hackernews'

call plug#end()

""" Python3 VirtualEnv
let g:python3_host_prog = expand('~/.config/nvim/env/bin/python')

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
tmap <C-w> <Esc><C-w>
"tmap <C-d> <Esc>:q<CR>
autocmd BufWinEnter,WinEnter term://* startinsert
autocmd BufLeave term://* stopinsert

" Deoplete
let g:deoplete#enable_at_startup = 1
" Disable documentation window
set completeopt-=preview

" Supertab
let g:SuperTabDefaultCompletionType = "<C-n>"

" Ultisnips
let g:UltiSnipsExpandTrigger="<C-Space>"
let g:UltiSnipsJumpForwardTrigger="<Tab>"
let g:UltiSnipsJumpBackwardTrigger="<C-x>"

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

" Trim Whitespaces
function! TrimWhitespace()
    let l:save = winsaveview()
    %s/\\\@<!\s\+$//e
    call winrestview(l:save)
endfunction

" Dracula Mode (Dark)
function! ColorDracula()
    let g:airline_theme=''
    color dracula
    IndentLinesEnable
endfunction

" Seoul256 Mode (Dark & Light)
function! ColorSeoul256()
    let g:airline_theme='silver'
    color seoul256
    IndentLinesDisable
endfunction

" Forgotten Mode (Light)
function! ColorForgotten()
    " Light airline themes: tomorrow, silver, alduin
    " Light colors: forgotten-light, nemo-light
    let g:airline_theme='tomorrow'
    color forgotten-light
    IndentLinesDisable
endfunction

" Zazen Mode (Black & White)
function! ColorZazen()
    let g:airline_theme='badcat'
    color zazen
    IndentLinesEnable
endfunction

""" Custom Mappings
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv
let mapleader=","
nmap <leader>q :NERDTreeToggle<CR>
nmap \ <leader>q
nmap <leader>w :TagbarToggle<CR>
nmap <leader>ee :Colors<CR>
nmap <leader>ea :AirlineTheme 
nmap <leader>e1 :call ColorDracula()<CR>
nmap <leader>e2 :call ColorSeoul256()<CR>
nmap <leader>e3 :call ColorForgotten()<CR>
nmap <leader>e4 :call ColorZazen()<CR>
nmap <leader>r :so ~/.config/nvim/init.vim<CR>
nmap <leader>t :call TrimWhitespace()<CR>
xmap <leader>a gaip*
nmap <leader>a gaip*
nmap <leader>s <C-w>s<C-w>j:terminal<CR>
nmap <leader>vs <C-w>v<C-w>l:terminal<CR>
nmap <leader>d <Plug>(pydocstring)
"nmap <leader>f :FZF<CR>
"nmap <leader>rg :Reg<CR>
nmap <leader>g :Goyo<CR>
nmap <leader>h :RainbowParentheses!!<CR>
nmap <leader>j :set filetype=journal<CR>
nmap <leader>k :ColorToggle<CR>
nmap <leader>l :Limelight!!<CR>
xmap <leader>l :Limelight!!<CR>
autocmd FileType python nmap <leader>x :0,$!~/.config/nvim/env/bin/python -m yapf<CR>
"nmap <leader>n :HackerNews best<CR>J
nmap <silent> <leader><leader> :noh<CR>
nmap <Tab> :bnext<CR>
nmap <S-Tab> :bprevious<CR>

" Search files/words
nnoremap <C-g> :Rg<Cr>
nnoremap <C-p> :FZF<Cr>


if has('nvim-0.4.0')
   Plug 'ncm2/float-preview.nvim'
endif
  " LAZYGIT {{{
function! ToggleLazyGit()
	echo "Loaded Lazygit"
	call ToggleTerm('lazygit')
endfunction
nnoremap <silent><leader>ll :call ToggleLazyGit()<cr>
    tnoremap <silent><leader>ll <C-\><C-n>:call ToggleLazyGit()<CR>
  " }}}
  " CREATE FLOATING WINDOW {{{
function! CreateCenteredFloatingWindow()
  let width  = float2nr(&columns * 0.9)
  let height = float2nr(&lines * 0.8)
  let top    = ((&lines - height) / 2) - 1
  let left   = (&columns - width) / 2
  let opts   = { 'relative': 'editor', 'row': top, 'col': left, 'width': width, 'height': height, 'style': 'minimal' }
  let top    = "╭" . repeat("─", width - 2) . "╮"
  let mid    = "│" . repeat(" ", width - 2) . "│"
  let bot    = "╰" . repeat("─", width - 2) . "╯"
  let lines  = [top] + repeat([mid], height - 2) + [bot]
  let s:buf  = nvim_create_buf(v:false, v:true)

  call nvim_buf_set_lines(s:buf, 0, -1, v:true, lines)
  call nvim_open_win(s:buf, v:true, opts)
  set winhl=Normal:Floating
  call InvertBackground()

  call nvim_open_win(nvim_create_buf(v:false, v:true), v:true, CreatePadding(opts))
  autocmd BufWipeout <buffer> exe 'bwipeout '.s:buf
  autocmd BufWipeout <buffer> call ResetBackground()
endfunction

function! CreatePadding(opts)
  let a:opts.row    += 1
  let a:opts.height -= 2
  let a:opts.col    += 2
  let a:opts.width  -= 4
  return a:opts
endfunction
" }}}
" TOGGLE TERMINAL && ON TERMINAL EXIT {{{
function! ToggleTerm(cmd)
  if empty(bufname(a:cmd))
    call CreateCenteredFloatingWindow()
    call termopen(a:cmd, { 'on_exit': function('OnTermExit') })
  else
    bwipeout!
  endif
endfunction

function! OnTermExit(job_id, code, event) dict
  if a:code == 0
    bwipeout!
  endif
endfunction
" }}}
" INVERT && RESET BACKGROUND {{{
function! InvertBackground()
  hi InactiveWindow guibg=NONE
  hi ActiveWindow   guibg=#2c323c
  set winhighlight=Normal:ActiveWindow,NormalNC:InactiveWindow
endfunction

function! ResetBackground()
  hi ActiveWindow   guibg=NONE
  hi InactiveWindow guibg=#2c323c
  set winhighlight=Normal:ActiveWindow,NormalNC:InactiveWindow
endfunction
" }}}
" REMOVE EMPTY BUFFERS {{{
function! RemoveEmptyBuffers()
  let buffers = filter(range(1, bufnr('$')), 'buflisted(v:val) && empty(bufname(v:val)) && bufwinnr(v:val)<0 && !getbufvar(v:val, "&mod")')
  if !empty(buffers)
      silent exe 'bw ' . join(buffers, ' ')
  endif
endfunction
" }}}
" }}}
  " TERMINAL BEHAVIOR {{{
augroup TerminalBehavior
  autocmd!
  autocmd TermOpen * setlocal listchars= nonumber norelativenumber nowrap winfixwidth laststatus=0 noruler signcolumn=no noshowmode
  autocmd TermOpen * startinsert
  autocmd TermClose * set laststatus=2 showmode ruler
augroup END


" Terminal buffer options for fzf
autocmd! FileType fzf
autocmd  FileType fzf set noshowmode noruler nonu
if has('nvim') && exists('&winblend') && &termguicolors
  set winblend=20

  hi NormalFloat guibg=None
  if exists('g:fzf_colors.bg')
    call remove(g:fzf_colors, 'bg')
  endif

  if stridx($FZF_DEFAULT_OPTS, '--border') == -1
    let $FZF_DEFAULT_OPTS .= ' --border'
  endif

  function! FloatingFZF()
    let width = float2nr(&columns * 0.8)
    let height = float2nr(&lines * 0.6)
    let opts = { 'relative': 'editor',
               \ 'row': (&lines - height) / 2,
               \ 'col': (&columns - width) / 2,
               \ 'width': width,
               \ 'height': height }

    call nvim_open_win(nvim_create_buf(v:false, v:true), v:true, opts)
  endfunction

  let g:fzf_layout = { 'window': 'call FloatingFZF()' }
endif

