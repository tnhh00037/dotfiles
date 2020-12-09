" Airline
"let g:airline_powerline_fonts = 1
let g:airline_section_z = ' %{strftime("%-I:%M %p")}'
let g:airline_section_warning = ''
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline_theme='simple'
" Supertab
let g:SuperTabDefaultCompletionType = "<C-n>"

" Ultisnips
let g:UltiSnipsExpandTrigger="<C-e>"
let g:UltiSnipsJumpForwardTrigger="<C-e>"

let g:airline_theme='gruvbox_material'
let g:gruvbox_material_background = 'hard'
let g:gruvbox_material_palette = 'mix'
"let g:gruvbox_material_transparent_background = 1

color gruvbox-material
let g:gruvbox_material_better_performance = 1
let g:gruvbox_material_current_word = 'bold'
let g:gruvbox_material_diagnostic_line_highlight = 1
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

let g:gruvbox_invert_selection='0'

" EasyAlign
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" Easy Motion
let g:EasyMotion_do_mapping = 0 " Disable default mappings
nmap fw <Plug>(easymotion-overwin-w)
nmap ff <Plug>(easymotion-overwin-f)
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

" Gruvbox-Material (Dark)
function! GruvBoxMaterial()
    let g:airline_theme='gruvbox_material'
    let g:gruvbox_material_background = 'hard'
    let g:gruvbox_material_palette = 'mix'

    color gruvbox-material
    IndentLinesEnable
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors

    let g:gruvbox_invert_selection='0'
endfunction

nnoremap <leader>cc <Plug>NERDCommenterToggle<CR>


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

map z/ <Plug>(incsearch-fuzzy-/)
map z? <Plug>(incsearch-fuzzy-?)

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
    set linespace=7
"  command! AirlineToggle
endfunction
autocmd! User GoyoEnter nested call <SID>goyo_enter()

" coc config
nmap <silent> <leader>jd <Plug>(coc-definition)
nmap <silent> <leader>jy <Plug>(coc-type-definition)
nmap <silent> <leader>gr <Plug>(coc-references)
nmap <leader>do <Plug>(coc-codeaction)
nmap <leader>rr <Plug>(coc-rename)
nnoremap <leader>prw :CocSearch <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>err :CocList diagnostics<CR>
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
"nnoremap <silent> K :call CocAction('doHover')<CR>
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
let g:coc_global_extensions = [
\ 'coc-snippets',
\ 'coc-prettier',
\ 'coc-pairs',
\ 'coc-tsserver',
\ 'coc-json',
\ 'coc-go',
\ ]

if has('nvim')
  inoremap <silent><expr> <c-n> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif
"function! s:show_hover_doc()
"  call timer_start(100, 'ShowDocIfNoDiagnostic')
"endfunction
"autocmd CursorHoldI * :call <SID>show_hover_doc()
"autocmd CursorHold * :call <SID>show_hover_doc()
"autocmd CursorHold * silent call CocActionAsync('highlight')
"autocmd FileType js,ts,cpp,cxx,h,hpp,c :call GoCoc()

" Git gutter:
nmap ghp <Plug>(GitGutterPreviewHunk)

" Ignore all Dirvish keymap
augroup dirvish_config
    autocmd!
    autocmd FileType dirvish silent! unmap <buffer> <C-p>
augroup END

