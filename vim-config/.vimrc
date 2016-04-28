execute pathogen#infect()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                     GENERAL                                  "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype plugin indent on
syntax on
set nocompatible
set number
set showmatch
set autoread
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
set cul
set t_ut=
set term=screen-256color
set clipboard=unnamed
set bs=indent,eol,start
set noshowmode

colorscheme lucid

let mapleader = "\<Space>"

" remove trailing whitespace on save
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                     KEYBINDS                                 "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap / <Plug>(easymotion-sn)
nmap ? <Plug>(easymotion-sn)
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)

map <silent> -- :NERDTreeToggle<CR>

inoremap <c-s> <Esc>:Update<CR>

nnoremap <c-o> :bnext<cr>
nnoremap <c-i> :bprev<cr>
nnoremap <c-p> :bdelete<cr>

" Leader maps
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>o :e 
nnoremap <Leader>y :w !pbcopy<CR>

let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <c-l> :TmuxNavigateRight<cr>
nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
nnoremap <silent> <c-k> :TmuxNavigateUp<cr>

nnoremap <Leader>h <C-W>h
nnoremap <Leader>j <C-W>j
nnoremap <Leader>k <C-W>k
nnoremap <Leader>l <C-W>l
nnoremap <Leader>s <C-W>s
nnoremap <Leader>v <C-W>v

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  LANGUAGES                                   "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Xi
au BufRead,BufNewFile *.xi set filetype=xi

" Tex
autocmd FileType tex :NoMatchParen

" OCaml
" tell supertab to call Merlin
au FileType ocaml call SuperTabSetDefaultCompletionType("<c-x><c-o>")


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  PLUGINS                                     "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" CtrlP
let g:netrw_liststyle=3
let g:ctrlp_map = '<Leader>p'
let g:ctrlp_cmd = 'CtrlP'
 
" Ignore some folders and files for CtrlP indexing
let g:ctrlp_custom_ignore = {
   \ 'dir':  '\.git$\|\.yardoc\|public$|log\|tmp$',
   \ 'file': '\.so$\|\.dat$|\.DS_Store$'
   \ }
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" Merlin
"let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
"execute "set rtp+=" . g:opamshare . "/merlin/vim"
"set rtp+=~/Users/ralphrecto/.vim/ocp-indent-vim

" Vim Airline
"enable showing all buffers
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_theme = 'zenburn'
set statusline+=%{fugitive#statusline()}

let g:tmux_navigator_no_mappings = 1

let g:SuperTabDefaultCompletionType = 'context'
