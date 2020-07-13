" Airline
let g:airline_powerline_fonts = 1
let g:airline_section_z = ' %{strftime("%-I:%M %p")}'
let g:airline_section_warning = ''
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_theme='simple'
" Supertab
let g:SuperTabDefaultCompletionType = "<C-n>"

" Ultisnips
let g:UltiSnipsExpandTrigger="<C-e>"
let g:UltiSnipsJumpForwardTrigger="<C-e>"

" EasyAlign
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" Easy Motion
let g:EasyMotion_do_mapping = 0 " Disable default mappings
nmap fw <Plug>(easymotion-overwin-w)
nmap f <Plug>(easymotion-overwin-f)
let g:EasyMotion_smartcase = 1

" LAZYGIT {{{
function! ToggleLazyGit()
	echo "Loaded Lazygit"
	call ToggleTerm('lazygit')
endfunction
"nnoremap <silent> <leader>gg :LazyGit<CR>
nnoremap <silent> <leader>gg :call ToggleLazyGit()<CR>


""" FZF / Ripgrep
nnoremap <C-f> :Rg<Cr>
nnoremap <C-p> :Files<Cr>

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

" Dracula Mode (Dark)
function! ColorDracula()
    let g:airline_theme='simple'
    color dracula
    IndentLinesEnable
endfunction

" Gruvbox Mode (Dark)
function! GruvBox()
    let g:airline_theme='simple'
    let g:gruvbox_constrast_dark='hard'
    color gruvbox
    IndentLinesEnable
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors

    let g:gruvbox_invert_selection='0'
endfunction


""" NERDTree
let g:tagbar_width = 30
let g:tagbar_iconchars = ['↠', '↡']
let NERDTreeShowHidden=1
let g:NERDTreeDirArrowExpandable = '↠'
let g:NERDTreeDirArrowCollapsible = '↡'

nmap <leader>q :NERDTreeToggle<CR>
nmap \ :NERDTreeToggle<CR>
nnoremap <silent> <leader>pv :NERDTreeFind<CR>

""" Incsearch.vim x fuzzy x vim-easymotion
source ~/.config/nvim/plugged/incsearch-easymotion.vim/autoload/incsearch/config/easymotion.vim
function! s:config_easyfuzzymotion(...) abort
  return extend(copy({
  \   'converters': [incsearch#config#fuzzy#converter()],
  \   'modules': [incsearch#config#easymotion#module()],
  \   'keymap': {"\<CR>": '<Over>(easymotion)'},
  \   'is_expr': 0,
  \   'is_stay': 1
  \ }), get(a:, 1, {}))
endfunction

map z/ <Plug>(incsearch-easymotion-/)

noremap <silent><expr> <Space>/ incsearch#go(<SID>config_easyfuzzymotion())

""" vim-todo-list
let g:VimTodoListsCustomKeyMapper = 'VimTodoListsCustomMappings'

function! VimTodoListsCustomMappings()
  nnoremap <buffer> <leader>m :VimTodoListsToggleItem<CR>
  noremap <buffer> <leader>e :silent call VimTodoListsSetItemMode()<CR>
endfunction

" Custom AirlineToggle
function! AirlineToggleCustom() 
    echo 'toggle airline'

    let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#tabline#buffer_nr_show = 1
    let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#tabline#left_sep = ' '
    let g:airline#extensions#tabline#left_alt_sep = '|'
    let g:airline_theme='simple'
endfunction
" Goyo
function! s:goyo_enter()
"  if executable('tmux') && strlen($TMUX)
"    silent !tmux set status off
"    silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
"  endif
  set list
set listchars=tab:>-
  set number
  set title
  set relativenumber
  set nu rnu
"  command! AirlineToggle
endfunction
autocmd! User GoyoEnter nested call <SID>goyo_enter()

" coc config
nmap <silent> <leader>jd <Plug>(coc-definition)
nmap <silent> <leader>jy <Plug>(coc-type-definition)
nmap <silent> <leader>gr <Plug>(coc-references)
autocmd CursorHold * silent call CocActionAsync('highlight')
autocmd FileType js,ts,cpp,cxx,h,hpp,c :call GoCoc()
