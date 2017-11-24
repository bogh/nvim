"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Important:
"       This requries that you install https://github.com/amix/vimrc !
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin installation
call plug#begin()

Plug 'fatih/vim-go'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'jlanzarotta/bufexplorer'
Plug 'junegunn/goyo.vim'
Plug 'itchyny/lightline.vim'
" Plug 'yegappan/mru'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'amix/open_file_under_cursor.vim'
" Plug 'vim-syntastic/syntastic'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'godlygeek/tabular'
Plug 'vim-scripts/tlib'
Plug 'tpope/vim-abolish'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'sophacles/vim-bundle-mako'
Plug 'tpope/vim-commentary'
Plug 'nvie/vim-flake8'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'michaeljsmith/vim-indent-object'
Plug 'groenewege/vim-less'
Plug 'tpope/vim-markdown'
Plug 'terryma/vim-multiple-cursors'
Plug 'digitaltoad/vim-pug'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'amix/vim-zenroom2'
Plug 'maxbrunsfeld/vim-yankstack'
Plug 'mkitt/tabline.vim'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-go', { 'do': 'make'}

Plug 'Raimondi/delimitMate'
Plug 'wojtekmach/vim-rename'
Plug 'mileszs/ack.vim'
Plug 'majutsushi/tagbar'
Plug 'ludovicchabant/vim-gutentags'

Plug 'SirVer/ultisnips'
" Plug 'honza/vim-snippets'
Plug 'easymotion/vim-easymotion'
Plug 'Shougo/denite.nvim'

call plug#end()

call deoplete#enable()

" """"""""""""""""""""""""""""""
" " => Load pathogen paths
" """"""""""""""""""""""""""""""
" let s:vim_runtime = expand('<sfile>:p:h')."/.."
" call pathogen#infect(s:vim_runtime.'/sources_forked/{}')
" call pathogen#infect(s:vim_runtime.'/sources_non_forked/{}')
" call pathogen#infect(s:vim_runtime.'/my_plugins/{}')
" call pathogen#helptags()

""""""""""""""""""""""""""""""
" => bufExplorer plugin
""""""""""""""""""""""""""""""
let g:bufExplorerDefaultHelp=0
let g:bufExplorerShowRelativePath=1
let g:bufExplorerFindActive=1
let g:bufExplorerSortBy='name'
map <leader>o :BufExplorer<cr>

""""""""""""""""""""""""""""""
" => YankStack
""""""""""""""""""""""""""""""
let g:yankstack_yank_keys = ['y', 'd']

nmap <c-p> <Plug>yankstack_substitute_older_paste
nmap <c-n> <Plug>yankstack_substitute_newer_paste


""""""""""""""""""""""""""""""
" => CTRL-P
""""""""""""""""""""""""""""""
let g:ctrlp_working_path_mode = 0

let g:ctrlp_map = '<c-f>'
map <c-b> :CtrlPBuffer<cr>
noremap <leader>f :CtrlPMRUFiles<cr>

let g:ctrlp_max_height = 20
let g:ctrlp_custom_ignore = 'node_modules\|^\.DS_Store\|^\.git\|^\.coffee'


""""""""""""""""""""""""""""""
" => ZenCoding
""""""""""""""""""""""""""""""
" Enable all functions in all modes
let g:user_zen_mode='a'


""""""""""""""""""""""""""""""
" => snipMate (beside <TAB> support <CTRL-j>)
""""""""""""""""""""""""""""""
ino <c-j> <c-r>=snipMate#TriggerSnippet()<cr>
snor <c-j> <esc>i<right><c-r>=snipMate#TriggerSnippet()<cr>


""""""""""""""""""""""""""""""
" => Vim grep
""""""""""""""""""""""""""""""
let Grep_Skip_Dirs = 'RCS CVS SCCS .svn generated'
set grepprg=/bin/grep\ -nH


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Nerd Tree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:NERDTreeWinPos = "right"
let g:NERDTreeShowHidden=0
let g:NERDTreeIgnore = ['\.pyc$', '__pycache__']
let g:NERDTreeWinSize=35
let g:NERDTreeHighlightCursorline=1

map <F7> :NERDTreeToggle<cr>
map <leader>nn :NERDTreeToggle<cr>
map <leader>nb :NERDTreeFromBookmark<Space>
map <leader>nf :NERDTreeFind<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-multiple-cursors
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:multi_cursor_next_key="\<C-s>"


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => surround.vim config
" Annotate strings with gettext 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
vmap Si S(i_<esc>f)
au FileType mako vmap Si S"i${ _(<esc>2f"a) }<esc>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => lightline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ ['mode', 'paste'],
      \             ['fugitive', 'readonly', 'filename', 'modified'] ],
      \   'right': [ [ 'lineinfo' ], ['percent'] ]
      \ },
      \ 'component': {
      \   'filename': '%f',
      \   'readonly': '%{&filetype=="help"?"":&readonly?"🔒":""}',
      \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
      \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
      \ },
      \ 'component_visible_condition': {
      \   'readonly': '(&filetype!="help"&& &readonly)',
      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
      \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
      \ },
      \ 'separator': { 'left': ' ', 'right': ' ' },
      \ 'subseparator': { 'left': ' ', 'right': ' ' }
      \ }

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vimroom
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:goyo_width=160
let g:goyo_margin_top = 2
let g:goyo_margin_bottom = 2
nnoremap <silent> <leader>z :Goyo<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim-go
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:go_fmt_command = "goimports"
" let g:go_auto_sameids = 0
" let g:go_fmt_fail_silently = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_variable_assignments = 1
let g:go_highlight_variable_declarations = 1
let g:go_highlight_format_strings = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_build_constraints = 1
let g:go_jump_to_error = 0
let g:go_def_reuse_buffer = 1

let g:go_gocode_unimported_packages = 1
let g:go_template_use_pkg = 1

let g:go_list_height = 10
let g:go_list_type = "quickfix"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Syntastic (syntax checker)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Python
let g:syntastic_python_checkers=['pyflakes']

" Javascript
let g:syntastic_javascript_checkers = ['jshint']

" Go
let g:syntastic_auto_loc_list = 1
let g:syntastic_go_checkers = ['go']

" Custom CoffeeScript SyntasticCheck
func! SyntasticCheckCoffeescript()
    let l:filename = substitute(expand("%:p"), '\(\w\+\)\.coffee', '.coffee.\1.js', '')
    execute "tabedit " . l:filename
    execute "SyntasticCheck"
    execute "Errors"
endfunc
nnoremap <silent> <leader>c :call SyntasticCheckCoffeescript()<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Git gutter (Git diff)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:gitgutter_enabled=0
nnoremap <silent> <leader>d :GitGutterToggle<cr>

" Ultisnips
let g:UltiSnipsExpandTrigger="<Tab>"
let g:UltiSnipsJumpForwardTrigger="<Tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-Tab>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

"""""""""""""""""""""""""""""""""""""""""""""
" Guten Tags
"""""""""""""""""""""""""""""""""""""""""""""
let g:gutentags_ctags_exclude=["*.js", "*.css"]
let g:gutentags_ctags_tagfile=".tags"
let g:gutentags_ctags_executable="gotags"


" """""""""""""""""""""""""""""""""""""""""""
" TagBar
" """""""""""""""""""""""""""""""""""""""""""
let g:tagbar_autofocus = 1
let g:tagbar_compact = 1
let g:tagbar_autoshowtag = 1
let g:tagbar_autopreview = 0
let g:tagbar_previewwin_pos = "above"
let g:tagbar_left = 1
