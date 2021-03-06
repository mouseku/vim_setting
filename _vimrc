"set background=dark
set background=light
" Plugins will be downloaded under the specified directory.

call plug#begin('~/.vim/plugged')


" Declare the list of plugins.
Plug 'tpope/vim-surround'
Plug 'vim-scripts/VisIncr'
Plug 'heavenshell/vim-jsdoc'
Plug 'junegunn/vim-easy-align'
Plug 'majutsushi/tagbar'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-repeat'
Plug 'airblade/vim-gitgutter'
Plug 'kien/ctrlp.vim'
Plug 'tpope/vim-markdown'
Plug 'jamshedvesuna/vim-markdown-preview'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'blueyed/vim-diminactive'
Plug 'nanotech/jellybeans.vim', {'tag':'v1.7'}
Plug 'mhinz/vim-startify'
Plug 'ervandew/supertab'
Plug 'scrooloose/syntastic'
Plug 'valloric/youcompleteme'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" List ends here. Plugins become visible to Vim after this call.

call plug#end()
set hlsearch " 검색어 하이라이팅
set nu " 줄번호
set autoindent " 자동 들여쓰기
set scrolloff=2
set wildmode=longest,list
set ts=4 "tag select
set sts=4 "st select
set sw=1 " 스크롤바 너비
set autowrite " 다른 파일로 넘어갈 때 자동 저장
set autoread " 작업 중인 파일 외부에서 변경됬을 경우 자동으로 불러옴
set cindent " C언어 자동 들여쓰기
set bs=eol,start,indent
set history=256
set laststatus=2 " 상태바 표시 항상
"set paste " 붙여넣기 계단현상 없애기
set shiftwidth=4 " 자동 들여쓰기 너비 설정
set showmatch " 일치하는 괄호 하이라이팅
set smartcase " 검색시 대소문자 구별
set smarttab
set smartindent
set softtabstop=4
set tabstop=4
set ruler " 현재 커서 위치 표시
set incsearch
set statusline=\ %<%l:%v\ [%P]%=%a\ %h%m%r\ %F\" 마지막으로 수정된 곳에 커서를 위치함
au BufReadPost *
\ if line("'\"") > 0 && line("'\"") <= line("$") |
\ exe "norm g`\"" |
\ endif" 파일 인코딩을 한국어로
if $LANG[0]=='k' && $LANG[1]=='o'
set fileencoding=korea
endif" 구문 강조 사용
if has("syntax")
 syntax on
endif


imap <F5> <Esc>:w<CR>:!clear;python %<CR>


set t_Co=256

" for jellybeans
colorscheme jellybeans

" for taglist
nmap <F8> :Tagbar<CR>

" for indent guide
let g:indentguides_spacechar = '┆'
let g:indentguides_tabchar = '|'
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1

" for vim-airline
let g:airline#extensions#tabline#enabled = 1 " turn on buffer list
let g:airline_theme='hybrid'
set laststatus=2 " turn on bottom bar
let mapleader = ","
nnoremap <leader>q :bp<CR>
nnoremap <leader>w :bn<CR>

" for blueyed/vim-diminactive
let g:diminactive_enable_focus = 1

syntax enable
filetype indent on
highlight Comment term=bold cterm=bold ctermfg=4

"===============
"Key mapping
"===============
noremap <Leader>bmh :OpenBookmark home<CR> 
noremap <Leader>bmc :OpenBookmark c<CR> 
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
nnoremap <C-F> :NERDTreeFind<CR>
nnoremap <Leader>nt :NERDTreeToggle<CR>


" Tree 아이콘 변경
let g:NERDTreeDirArrowExpandable = '?'
let g:NERDTreeDirArrowCollapsible = '?'
" 파일없이 vim만 틸 경우 자동으로 NERD Tree 실행
" 디렉토리를 vim으로 여는 경우 NERD Tree 실행.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

