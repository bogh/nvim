
" let g:deoplete#enable_at_startup = 1

" " neocomplete like
" set completeopt+=noinsert
" " deoplete.nvim recommend
" set completeopt+=noselect

" Color scheme
colorscheme solarized8
set background=dark
highlight ColorColumn ctermbg=235 guibg=#2c2d27

" Goyo fix neovim colorscheme reset
function! s:goyo_leave()
    colorscheme solarized8
    set background=dark
endfunction

autocmd! User GoyoLeave nested call <SID>goyo_leave()

" Quicky switch background
map <Leader>bg :let &background = ( &background == "dark"? "light" : "dark" )<CR>
" set cursorline
" hi CursorLine cterm=NONE ctermbg=66 ctermfg=white

" Tags
nmap <F8> :TagbarToggle<CR>
set tags=.tags

inoremap <C-@> <C-x><C-o>

nmap <C-g><C-s> :Gstatus<cr>
nmap <C-g><C-p> :Gpush
nmap <C-g><C-u> :Gpull

" Duplicate lines
nmap <C-S-d> "aY"ap
vmap <C-S-d> mz"ay`zp

" Open file from same directory
nmap <leader>vo :vsplit %:h<cr>
nmap <leader>so :split %:h<cr>

highlight OverLength ctermbg=54 ctermfg=white guibg=#592929
" match OverLength /\%81v.\+/
set foldmethod=syntax
set foldlevel=20

autocmd VimEnter * :NERDTreeToggle<cr>:NERDTreeClose<cr>

set listchars=tab:\.\ ,trail:·
set list
set cursorline
set cursorcolumn

set splitright
set splitbelow
set clipboard=unnamed
