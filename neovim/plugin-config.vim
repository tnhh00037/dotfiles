color gruvbox
let mapleader=" "
" Airline
let g:airline_powerline_fonts = 1
let g:airline_section_z = ' %{strftime("%-I:%M %p")}'
let g:airline_section_warning = ''
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
    let g:airline_theme=''
    color dracula
    IndentLinesEnable
endfunction

" Gruvbox Mode (Dark)
function! GruvBox()
    let g:airline_theme=''
    color gruvbox
    IndentLinesEnable
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

