set nocompatible

execute pathogen#infect()

filetype plugin indent on
 
syntax on
set number
set showmatch
set incsearch
set autoindent
set history=1000
set expandtab
set shiftwidth=2
set tabstop=2
set softtabstop=2
set splitright
set noswapfile
set laststatus=2

autocmd FileType tex :NoMatchParen
au FileType tex setlocal nocursorline

nmap / <Plug>(easymotion-sn)
nmap ? <Plug>(easymotion-sn)
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)

map .. :ls<Enter>
map ,, :CtrlP ~/<Enter>
nnoremap -- :buffers<CR>:buffer<Space>

colorscheme molokai

let g:netrw_liststyle=3
" Ignore some folders and files for CtrlP indexing
 
let g:ctrlp_custom_ignore = {
   \ 'dir':  '\.git$\|\.yardoc\|public$|log\|tmp$',
   \ 'file': '\.so$\|\.dat$|\.DS_Store$'
   \ }

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'

let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
nnoremap <silent> <c-l> :TmuxNavigateRight<cr>
