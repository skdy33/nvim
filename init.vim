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
set paste " 붙여넣기 계단현상 없애기
set shiftwidth=4 " 자동 들여쓰기 너비 설정
set showmatch " 일치하는 괄호 하이라이팅
set smartcase " 검색시 대소문자 구별
set smarttab
set smartindent
set softtabstop=4
set tabstop=4
set ruler " 현재 커서 위치 표시
set incsearch
set statusline=\ %<%l:%v\ [%P]%=%a\ %h%m%r\ %F\
" 마지막으로 수정된 곳에 커서를 위치함
au BufReadPost *
\ if line("'\"") > 0 && line("'\"") <= line("$") |
\ exe "norm g`\"" |
\ endif
" 파일 인코딩을 한국어로
if $LANG[0]=='k' && $LANG[1]=='o'
set fileencoding=korea
endif
" 구문 강조 사용
if has("syntax")
 syntax on
endif
" 컬러 스킴 사용
" Vim color file


" CtrlP 플러그인 추가.
set runtimepath^=~/.local/share/nvim/bundle/ctrlp.vim
call plug#begin('~/.local/share/nvim/plugged')
Plug 'morhetz/gruvbox'
call plug#end()
colorscheme gruvbox
set background=dark

" vundle 추가
set nocompatible
filetype off

set rtp+=~/.local/share/nvim/bundle/Vundle.vim
call vundle#begin('~/.local/share/nvim/bundle')

Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline'

call vundle#end()

" personal 키 매핑
let mapleader=" "
" nvim configuration 적용 without restarting
map <leader>s :source ~/.config/nvim/init.vim<CR> 
" 단축키를 리더 키로 대체
map <leader>p :CtrlP<CR>
" 가장 가까운 .git 디렉토리를 cwd(현재 작업 디렉토리)로 사용
" 버전 관리를 사용하는 프로젝트를 할 때 꽤 적절하다.
" .svn, .hg, .bzr도 지원한다.
let g:ctrlp_working_path_mode = 'r'
" 여러 모드를 위한 단축키
nmap <leader>bb :CtrlPBuffer<cr>
nmap <leader>bm :CtrlPMixed<cr>
nmap <leader>bs :CtrlPMRU<cr>
set pastetoggle=<F2>

let g:python3_host_prog = '/home/mappiness/anaconda3/envs/torch/bin/python'

function! BuildComposer(info)
  if a:info.status != 'unchanged' || a:info.force
    if has('nvim')
      !cargo build --release
    else
      !cargo build --release --no-default-features --features json-rpc
    endif
  endif
endfunction
call plug#begin('~/.local/share/nvim/plugged')
Plug 'euclio/vim-markdown-composer', { 'do': function('BuildComposer') }
call plug#end()

" NERDTree ON 단축키를 "\nt"로 설정
map <Leader>nt :NERDTree<CR>

